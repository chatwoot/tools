#!/usr/bin/env ruby
# frozen_string_literal: true

# Run Captain tools against their real APIs, the way Captain runs them.
#
#   ruby tool-tester.rb <folder> [tool_id] [--dry-run] [--full] [--strict-variables]
#
# <folder> is an integration folder in this repository, such as stripe or cal-com.
# Without a tool_id, every tool in the folder runs one after another.
#
# Secrets are read from .env as <FOLDER>_<NAME> (for example STRIPE_API_KEY)
# and offered as the default; press Enter to keep one or type a new value.
# New secrets can be saved back to .env, which is git-ignored.
#
# Templates render with the same Liquid version and options as Captain
# (chatwoot enterprise/app/models/concerns/toolable.rb#render_template), and
# requests follow Captain's rules: install values are substituted first, GET
# sends no body, and only 2xx responses reach the response template.

require 'bundler/inline'

GEMS = proc do
  source 'https://rubygems.org'
  gem 'liquid', '5.4.0' # Keep in sync with chatwoot's Gemfile.lock
  gem 'dotenv', '~> 3.1'
  gem 'base64' # Required by liquid, no longer a default gem in Ruby 3.4
  gem 'bigdecimal'
end

begin
  gemfile(false, quiet: true, &GEMS)
rescue Bundler::BundlerError
  warn 'Installing gems for the first run…'
  gemfile(true, quiet: true, &GEMS)
end

require 'io/console'
require 'json'
require 'net/http'
require 'optparse'
require 'uri'
require 'yaml'

ROOT = __dir__
ENV_FILE = File.join(ROOT, '.env')
PREVIEW_LINES = 40

# Mirrors Captain's constants
INSTALL_PLACEHOLDER = /\$\{\{\s*(inputs|secrets)\.([a-z][a-z0-9_]*)\s*\}\}/i # Validator::INSTALL_PLACEHOLDER_PATTERN
NUMBER_PATTERN = /\A-?\d+(\.\d+)?\z/ # InstallService::NUMBER_PATTERN
LIQUID_DELIMITER = /\{\{|\{%/ # InstallService::LIQUID_DELIMITER_PATTERN
FAILURE_MESSAGE = 'An error occurred while executing the request' # HttpTool#perform
MAX_RESPONSE_BYTES = 1024 * 1024 # HttpTool::MAX_RESPONSE_SIZE
OPEN_TIMEOUT = 2 # SafeFetch::DEFAULT_OPEN_TIMEOUT
READ_TIMEOUT = 20 # SafeFetch::DEFAULT_READ_TIMEOUT
MAX_REDIRECTS = 10 # SsrfFilter default

class ToolError < StandardError; end
class Interrupted < StandardError; end

Result = Struct.new(:tool_id, :status, :code, :elapsed_ms, :note, keyword_init: true)

# ── Terminal ──────────────────────────────────────────────────────────────────

module Term
  COLOR = $stdout.tty? && !ENV.key?('NO_COLOR')
  STYLES = { bold: 1, dim: 2, italic: 3, red: 31, green: 32, yellow: 33, blue: 34, magenta: 35, cyan: 36, grey: 90 }.freeze

  module_function

  def style(text, *names)
    return text.to_s unless COLOR

    "\e[#{names.map { |name| STYLES.fetch(name) }.join(';')}m#{text}\e[0m"
  end

  def badge(text, color)
    return "[#{text}]" unless COLOR

    background = { green: 42, yellow: 43, red: 41, cyan: 46, magenta: 45 }.fetch(color)
    "\e[1;30;#{background}m #{text} \e[0m"
  end

  def width
    [[IO.console&.winsize&.last || 80, 60].max, 110].min
  end

  def visible_length(text)
    text.gsub(/\e\[[\d;]*m/, '').length
  end

  # Word-wraps each line, splitting only words longer than the limit (such as URLs)
  def wrap(text, limit)
    text.to_s.rstrip.split("\n", -1).flat_map do |line|
      indent = line[/\A\s*/]
      rows = [+'']
      line.split(/(?<= )/).each do |word|
        if visible_length(rows.last + word.rstrip) > limit && !rows.last.strip.empty?
          rows << indent.dup
          word = word.lstrip
        end
        rows.last << word
        rows[-1, 1] = rows.last.scan(/.{1,#{limit}}/) if visible_length(rows.last) > limit
      end
      rows.map(&:rstrip)
    end
  end

  def rule(title, subtitle = nil)
    label = " #{style(title, :bold)}#{subtitle ? "  #{style(subtitle, :dim)}" : ''} "
    puts
    puts "#{style('──', :grey)}#{label}#{style('─' * [width - visible_length(label) - 2, 0].max, :grey)}"
  end

  def panel(title, body, color: :grey)
    inner = width - 4
    top = "╭─ #{title} "
    puts style(top, color) + style('─' * [width - visible_length(top) - 1, 0].max + '╮', color)
    wrap(body, inner).each do |line|
      puts "#{style('│', color)} #{line}#{' ' * [inner - visible_length(line), 0].max} #{style('│', color)}"
    end
    puts style("╰#{'─' * (width - 2)}╯", color)
  end

  def ask(prompt, secret: false)
    print prompt
    $stdout.flush
    line = secret && $stdin.tty? ? $stdin.noecho(&:gets).tap { puts } : $stdin.gets
    raise Interrupted if line.nil?

    line.chomp
  end

  def confirm(prompt, default:)
    hint = default ? 'Y/n' : 'y/N'
    answer = ask("#{prompt} #{style("[#{hint}]", :dim)} ").strip.downcase
    answer.empty? ? default : answer.start_with?('y')
  end

  def choose(prompt, choices, default:)
    loop do
      answer = ask("#{prompt} #{style("[#{choices.join('/')}] (#{default})", :dim)} ").strip.downcase
      answer = default if answer.empty?
      return answer if choices.include?(answer)
    end
  end
end

# ── Pretty printing ───────────────────────────────────────────────────────────

def highlight_json(text)
  return text unless Term::COLOR

  text.gsub(/("(?:[^"\\]|\\.)*")(\s*:)?|\b(true|false|null)\b|(-?\b\d+(?:\.\d+)?(?:[eE][+-]?\d+)?\b)/) do
    string, colon, keyword, number = Regexp.last_match.captures
    if string
      colon ? Term.style(string, :cyan) + colon : Term.style(string, :green)
    elsif keyword
      Term.style(keyword, :magenta)
    else
      Term.style(number, :yellow)
    end
  end
end

def pretty_body(body, full:)
  text = begin
    highlight_json(JSON.pretty_generate(JSON.parse(body)))
  rescue JSON::ParserError
    body
  end
  lines = text.split("\n")
  hidden = full ? 0 : [lines.length - PREVIEW_LINES, 0].max
  shown = hidden.positive? ? lines.first(PREVIEW_LINES) : lines
  shown.each { |line| puts "  #{line}" }
  puts Term.style("  … #{hidden} more lines  (--full to show everything)", :dim, :italic) if hidden.positive?
end

def mask(value)
  value.length >= 8 ? "#{value[0, 3]}…••••" : '••••'
end

def redact(text, secrets)
  secrets.values.map(&:to_s).select { |value| value.length >= 4 }.reduce(text.to_s) do |result, value|
    result.gsub(value, mask(value))
  end
end

def human_size(bytes)
  bytes >= 1024 ? format('%.1f KB', bytes / 1024.0) : "#{bytes} B"
end

# ── Captain behaviour ─────────────────────────────────────────────────────────

def deep_stringify(value)
  case value
  when Hash then value.to_h { |key, item| [key.to_s, deep_stringify(item)] }
  when Array then value.map { |item| deep_stringify(item) }
  else value
  end
end

# Toolable#render_template. Captain records Liquid errors instead of raising them,
# so they are returned for display; only syntax errors fail the call.
def captain_render(source, context, strict_variables:)
  template = Liquid::Template.parse(source, error_mode: :strict)
  options = { registers: {}, strict_filters: true }
  options[:strict_variables] = true if strict_variables
  output = template.render(deep_stringify(context), **options)
  [output, template.errors.map(&:message)]
rescue Liquid::SyntaxError => e
  raise ToolError, "Template rendering failed: #{e.message}"
end

# InstallService#interpolate: install values are substituted as plain text, never rendered
def interpolate(value, values)
  case value
  when String
    value.gsub(INSTALL_PLACEHOLDER) { values.fetch(Regexp.last_match(1).downcase).fetch(Regexp.last_match(2), '').to_s }
  when Hash
    value.transform_values { |item| interpolate(item, values) }
  else
    value
  end
end

# InstallService.auth_field_names: fields used in auth_config must have a value even when optional
def auth_field_names(manifest)
  placeholders = manifest['tools'].flat_map { |tool| (tool['auth_config'] || {}).to_json.scan(INSTALL_PLACEHOLDER) }
  placeholders.group_by { |section, _| section.downcase }.transform_values { |pairs| pairs.map(&:last) }
end

def auth_headers(tool)
  config = tool['auth_config'] || {}
  case tool['auth_type']
  when 'bearer' then { 'Authorization' => "Bearer #{config['token']}" }
  when 'api_key' then { config['name'] => config['key'] }
  else {}
  end
end

def basic_credentials(tool)
  return unless tool['auth_type'] == 'basic'

  config = tool['auth_config'] || {}
  [config['username'], config['password']]
end

# ── Loading ───────────────────────────────────────────────────────────────────

def available_integrations
  Dir.glob(File.join(ROOT, '*', 'toolset.yml')).map { |path| File.basename(File.dirname(path)) }.sort
end

def fail!(message)
  puts "#{Term.style('✗', :red)} #{message}"
  exit 1
end

def load_manifest(folder)
  path = File.join(ROOT, folder, 'toolset.yml')
  fail!("No integration named #{Term.style(folder, :bold)}. Available: #{available_integrations.join(', ')}") unless File.exist?(path)
  YAML.safe_load(File.read(path), aliases: false)
end

# ── Prompts ───────────────────────────────────────────────────────────────────

def env_name(folder, key)
  "#{folder}_#{key}".upcase.tr('-', '_')
end

def field_label(key, spec, kind)
  title = spec['label'] || key
  required = spec.fetch('required', false)
  meta = title == key ? kind : "#{key} · #{kind}"
  flag = required ? Term.style('required', :yellow) : Term.style('optional', :dim)
  "  #{Term.style(title, :bold)}  #{Term.style(meta, :dim)}  #{flag}"
end

def coerce(raw, kind, key)
  case kind
  when 'integer'
    raise ToolError, "#{key} must be an integer." unless raw.match?(/\A-?\d+\z/)

    raw.to_i
  when 'number'
    raise ToolError, "#{key} must be a number." unless raw.match?(NUMBER_PATTERN)

    raw.include?('.') ? raw.to_f : raw.to_i
  when 'boolean'
    %w[1 true yes y].include?(raw.downcase)
  else
    raw
  end
end

# Prompts for one input, secret, or tool parameter. Blank keeps the default.
def ask_field(key, spec, default: nil, source: nil, kind: nil, section: nil)
  kind ||= spec['type'] || 'string'
  required = spec.fetch('required', false)
  puts field_label(key, spec, kind)
  puts "  #{Term.style(spec['description'], :dim)}" if spec['description']
  if default && !default.empty?
    shown = kind == 'password' ? mask(default) : default
    puts "  #{Term.style('Enter to keep', :dim)} #{Term.style(shown, :green)} #{Term.style("from #{source}", :dim)}"
  end
  options = Array(spec['options'])
  puts "  #{Term.style("Options: #{options.join(', ')}", :dim)}" if options.any?

  loop do
    raw = Term.ask("  #{Term.style('›', :cyan)} ", secret: kind == 'password').strip
    raw = default.to_s if raw.empty? && default && !default.empty?
    if raw.empty?
      return nil unless required

      puts "  #{Term.style('This value is required.', :red)}"
      next
    end
    if options.any? && !options.include?(raw)
      puts "  #{Term.style("Choose one of: #{options.join(', ')}", :red)}"
      next
    end
    if section == 'inputs' && raw.match?(LIQUID_DELIMITER)
      puts "  #{Term.style('Inputs cannot contain {{ or {%.', :red)}"
      next
    end
    begin
      return coerce(raw, kind, key)
    rescue ToolError => e
      puts "  #{Term.style(e.message, :red)}"
    end
  end
end

def collect_install_values(folder, manifest, file_vars)
  auth_fields = auth_field_names(manifest)
  values = { 'inputs' => {}, 'secrets' => {} }
  return values if values.keys.all? { |section| (manifest[section] || {}).empty? }

  Term.rule('Setup')
  changed = {}
  values.each_key do |section|
    (manifest[section] || {}).each do |key, spec|
      var = env_name(folder, key)
      spec = spec.merge('required' => true) if Array(auth_fields[section]).include?(key)
      kind = section == 'secrets' ? 'password' : spec['type']
      source = file_vars.include?(var) ? '.env' : "$#{var}"
      value = ask_field(key, spec, default: ENV[var], source: source, kind: kind, section: section)
      values[section][key] = value.nil? ? '' : value
      changed[var] = value.to_s if section == 'secrets' && value && value.to_s != ENV[var].to_s
    end
  end

  if changed.any? && Term.confirm("\n  Save #{changed.size} secret#{'s' if changed.size != 1} to .env?", default: true)
    save_secrets(changed)
  end
  values
end

def env_line(key, value)
  value.include?("'") ? "#{key}=\"#{value.gsub(/[\\"]/) { "\\#{Regexp.last_match(0)}" }}\"" : "#{key}='#{value}'"
end

def save_secrets(values)
  lines = File.exist?(ENV_FILE) ? File.readlines(ENV_FILE, chomp: true) : []
  values.each do |key, value|
    index = lines.index { |line| line.match?(/\A\s*(export\s+)?#{Regexp.escape(key)}\s*=/) }
    index ? lines[index] = env_line(key, value) : lines << env_line(key, value)
  end
  File.write(ENV_FILE, "#{lines.join("\n")}\n")
  File.chmod(0o600, ENV_FILE)
  puts "  #{Term.style('✓', :green)} Saved #{values.keys.join(', ')} to .env"
end

# ── Requests ──────────────────────────────────────────────────────────────────

def build_request(manifest, tool, params, strict_variables:)
  warnings = []
  url = tool['endpoint_url']
  if url.include?('{{')
    url, errors = captain_render(url, params, strict_variables: strict_variables)
    warnings.concat(errors.map { |error| "endpoint_url: #{error}" })
  end

  body = nil
  if tool['request_template'] && !tool['request_template'].strip.empty? && tool['http_method'] != 'GET'
    body, errors = captain_render(tool['request_template'], params, strict_variables: strict_variables)
    warnings.concat(errors.map { |error| "request_template: #{error}" })
  end

  headers = (manifest['headers'] || {}).transform_values(&:to_s).merge(auth_headers(tool))
  headers['Content-Type'] = 'application/json' if body && !body.empty?
  if tool['auth_type'] == 'api_key' && tool.dig('auth_config', 'location').to_s == 'query'
    warnings << 'auth_config.location is query, but Captain always sends api_key auth as a header'
  end

  { method: tool['http_method'], url: url, headers: headers, body: body, basic: basic_credentials(tool), warnings: warnings }
end

def show_request(request, secrets)
  puts
  puts "  #{Term.badge(request[:method], :cyan)} #{redact(request[:url], secrets)}"
  request[:headers].each { |key, value| puts "  #{Term.style("#{key}:", :dim)} #{redact(value, secrets)}" }
  puts "  #{Term.style('basic auth:', :dim)} #{redact(request[:basic].first.to_s, secrets)}:••••" if request[:basic]
  if request[:body]
    puts
    pretty_body(redact(request[:body], secrets), full: true)
  end
  request[:warnings].each { |warning| puts "  #{Term.style("! #{warning}", :yellow)}" }
end

# SafeFetch: follows redirects, fails on non-2xx and on bodies over the size limit
def perform_http(request)
  uri = URI.parse(request[:url])
  MAX_REDIRECTS.succ.times do
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    http.open_timeout = OPEN_TIMEOUT
    http.read_timeout = READ_TIMEOUT
    klass = Net::HTTP.const_get(request[:method].capitalize)
    message = klass.new(uri)
    request[:headers].each { |key, value| message[key] = value }
    message.basic_auth(*request[:basic]) if request[:basic]
    message.body = request[:body] if request[:body]
    response = http.request(message)
    return response unless response.is_a?(Net::HTTPRedirection) && response['location']

    uri = URI.join(uri, response['location'])
  end
  raise ToolError, 'Too many redirects'
end

def show_response(response, elapsed_ms)
  code = response.code.to_i
  color = code < 300 ? :green : code < 400 ? :yellow : :red
  size = human_size(response.body.to_s.bytesize)
  puts
  puts "  #{Term.badge(code, color)} #{Term.style(response.message, color)}#{Term.style("  ·  #{elapsed_ms} ms  ·  #{size}", :dim)}"
end

def run_tool(manifest, tool, secrets, options)
  params = {}
  Array(tool['param_schema']).each do |param|
    # Captain treats parameters as required unless the schema says otherwise
    spec = param.merge('required' => param.fetch('required', true))
    value = ask_field(param['name'], spec)
    params[param['name']] = value unless value.nil?
  end

  request = build_request(manifest, tool, params, strict_variables: options[:strict_variables])
  show_request(request, secrets)
  return Result.new(tool_id: tool['id'], status: :dry_run) if options[:dry_run]

  if request[:method] != 'GET' && !Term.confirm("\n  #{Term.style("Send this #{request[:method]} request?", :yellow)}", default: false)
    return Result.new(tool_id: tool['id'], status: :skipped, note: 'not sent')
  end

  started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  response = perform_http(request)
  elapsed_ms = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - started) * 1000).round
  show_response(response, elapsed_ms)
  body = response.body.to_s.dup.force_encoding('UTF-8')

  unless response.is_a?(Net::HTTPSuccess)
    puts
    Term.panel('Captain receives', FAILURE_MESSAGE, color: :red)
    puts Term.style('  Captain drops non-2xx responses; the upstream body is shown for debugging only.', :dim)
    pretty_body(redact(body, secrets), full: options[:full]) unless body.strip.empty?
    return Result.new(tool_id: tool['id'], status: :failed, code: response.code.to_i, elapsed_ms: elapsed_ms, note: response.message)
  end

  if body.bytesize > MAX_RESPONSE_BYTES
    puts
    Term.panel('Captain receives', FAILURE_MESSAGE, color: :red)
    puts Term.style("  The body is over Captain's #{MAX_RESPONSE_BYTES / 1024} KB limit.", :dim)
    return Result.new(tool_id: tool['id'], status: :failed, code: response.code.to_i, elapsed_ms: elapsed_ms, note: 'too large')
  end

  template = tool['response_template']
  if template.nil? || template.strip.empty?
    puts
    Term.panel('Captain receives (raw body, no response_template)', redact(body, secrets), color: :magenta)
  else
    data = begin
      JSON.parse(body)
    rescue JSON::ParserError
      body
    end
    output, errors = captain_render(template, { 'response' => data, 'r' => data }, strict_variables: options[:strict_variables])
    puts
    Term.panel('Captain receives', output.strip.empty? ? Term.style('(empty)', :red) : redact(output, secrets), color: :magenta)
    errors.each { |error| puts "  #{Term.style("! #{error.delete_prefix('Liquid error: ')} (Captain drops the affected output)", :yellow)}" }
    puts
    puts Term.style('  Raw response', :dim)
    pretty_body(redact(body, secrets), full: options[:full])
    status = errors.any? || output.strip.empty? ? :warned : :ok
    return Result.new(tool_id: tool['id'], status: status, code: response.code.to_i, elapsed_ms: elapsed_ms,
                      note: errors.any? ? 'template errors' : output.strip.empty? ? 'empty output' : nil)
  end
  Result.new(tool_id: tool['id'], status: :ok, code: response.code.to_i, elapsed_ms: elapsed_ms)
rescue ToolError, Net::OpenTimeout, Net::ReadTimeout, SocketError, OpenSSL::SSL::SSLError, Errno::ECONNREFUSED => e
  puts
  Term.panel('Captain receives', FAILURE_MESSAGE, color: :red)
  puts "  #{Term.style("✗ #{e.class.name.split('::').last}: #{e.message}", :red)}"
  Result.new(tool_id: tool['id'], status: :failed, note: e.class.name.split('::').last)
end

# ── Output ────────────────────────────────────────────────────────────────────

def show_header(folder, manifest, options)
  tools = manifest['tools'] || []
  meta = [Term.style(manifest['category'] || 'Others', :cyan), "v#{manifest['version']}",
          "#{tools.size} tool#{'s' if tools.size != 1}"].join(Term.style('  ·  ', :dim))
  Term.panel(Term.style(manifest['name'] || folder, :bold), "#{meta}\n#{manifest['description']}")
  puts "  #{Term.style('Dry run:', :cyan)} requests are printed, not sent." if options[:dry_run]
  puts "  #{Term.style('Strict variables:', :yellow)} rendering like Captain before strict_variables was removed." if options[:strict_variables]
end

def show_disabled(tools, named:)
  return if tools.empty?

  if named
    puts "  #{Term.style("! #{tools.first['id']} is disabled in the manifest", :yellow)}, so Captain installs it turned off. Running it anyway."
  else
    ids = tools.map { |tool| tool['id'] }.join(', ')
    puts "  #{Term.style("Skipping disabled #{tools.size == 1 ? 'tool' : 'tools'}:", :yellow)} #{ids}. Name one to run it."
  end
end

def show_summary(results)
  Term.rule('Summary')
  icons = { ok: Term.style('✓', :green), warned: Term.style('!', :yellow), failed: Term.style('✗', :red),
            skipped: Term.style('–', :dim), dry_run: Term.style('◇', :cyan) }
  id_width = results.map { |result| result.tool_id.length }.max
  results.each do |result|
    code = result.code ? Term.style(result.code.to_s.ljust(4), result.code < 300 ? :green : :red) : '    '
    elapsed = result.elapsed_ms ? Term.style("#{result.elapsed_ms} ms".ljust(9), :dim) : ' ' * 9
    puts "  #{icons.fetch(result.status)}  #{result.tool_id.ljust(id_width)}  #{code}  #{elapsed}  #{Term.style(result.note.to_s, :dim)}"
  end
end

# ── Main ──────────────────────────────────────────────────────────────────────

def parse_options
  options = { full: false, dry_run: false, strict_variables: false }
  parser = OptionParser.new do |opts|
    opts.banner = 'Usage: ruby tool-tester.rb <folder> [tool_id] [options]'
    opts.on('--full', 'Show complete response bodies') { options[:full] = true }
    opts.on('--dry-run', 'Print requests without sending them') { options[:dry_run] = true }
    opts.on('--strict-variables', 'Render with strict_variables, like Captain before it was removed') do
      options[:strict_variables] = true
    end
  end
  args = parser.parse(ARGV)
  if args.empty?
    puts parser.banner
    fail!("Choose an integration: #{available_integrations.join(', ')}")
  end
  [args[0], args[1], options]
end

def main
  folder, tool_id, options = parse_options

  file_vars = []
  if File.exist?(ENV_FILE)
    file_vars = Dotenv.parse(ENV_FILE).keys.reject { |key| ENV.key?(key) }
    Dotenv.load(ENV_FILE) # Does not override variables already set in the shell
  end

  manifest = load_manifest(folder)
  tools = manifest['tools'] || []
  disabled = tools.reject { |tool| tool.fetch('enabled', true) }
  if tool_id
    # A named tool runs even when the manifest ships it disabled
    tools = tools.select { |tool| tool['id'] == tool_id }
    fail!("No tool #{Term.style(tool_id, :bold)} in #{folder}. Available: #{manifest['tools'].map { |tool| tool['id'] }.join(', ')}") if tools.empty?
    disabled &= tools
  else
    tools -= disabled
  end

  show_header(folder, manifest, options)
  show_disabled(disabled, named: tool_id)
  values = collect_install_values(folder, manifest, file_vars)
  installed_manifest = manifest.merge('tools' => tools.map do |tool|
    tool.merge(%w[endpoint_url auth_config request_template].to_h { |field| [field, interpolate(tool[field], values)] })
  end)

  results = []
  single = tools.size == 1
  installed_manifest['tools'].each_with_index do |tool, index|
    Term.rule("#{single ? '' : "[#{index + 1}/#{tools.size}]  "}#{tool['title']}", tool['id'])
    puts "  #{Term.style(tool['description'], :dim)}"
    unless single
      answer = Term.choose("\n  Run this tool?", %w[y n q], default: 'y')
      if answer == 'q'
        results.concat(tools[index..].map { |skipped| Result.new(tool_id: skipped['id'], status: :skipped) })
        break
      end
      if answer == 'n'
        results << Result.new(tool_id: tool['id'], status: :skipped)
        next
      end
    end
    puts
    results << run_tool(installed_manifest, tool, values['secrets'], options)
  end

  show_summary(results) unless single
  puts
end

begin
  main
rescue Interrupt, Interrupted
  puts "\n#{Term.style('Stopped.', :dim)}"
  exit 130
end
