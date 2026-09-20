require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  config.action_controller.forgery_protection_origin_check = false
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end
  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  host = "fuzzy-umbrella-gxqg9wv5j97v3p4q7-3000.app.github.dev"
  config.action_mailer.default_url_options = { host: host, protocol: 'https' }
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.quiet = true
  pf_domain = ENV['GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN']
  config.action_dispatch.default_headers = {
    'X-Frame-Options' => "ALLOW-FROM #{pf_domain}"
  }
  pf_host = "#{ENV['CODESPACE_NAME']}-3000.#{pf_domain}"
  config.hosts << pf_host
  config.action_cable.allowed_request_origins = ["https://#{pf_host}"]
end
