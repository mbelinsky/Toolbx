Thetoolbox::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  config.action_mailer.default_url_options = { host: "staging-toolbx.herokuapp.com", protocol: 'https' }
  config.action_mailer.asset_host = "https://staging-toolbx.herokuapp.com"

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Paperclip S3 stuff
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: Settings.s3.bucket,
      access_key_id: Settings.s3.access_key_id,
      secret_access_key: Settings.s3.secret_access_key
    }
  }

  # Basic auth to prevent bots/snooping
  config.middleware.insert_after(::Rack::Lock, "::Rack::Auth::Basic", "Staging") do |u, p|
    [u, p] == [Settings.basic_auth.username, Settings.basic_auth.password]
  end

  # Send email notification when the application throws an error
  config.middleware.use ExceptionNotification::Rack,
    email: {
      sender_address: 'staging-errors@thetoolbox.org',
      exception_recipients: 'paul@octopuscreative.com'
    }
end
