Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook_auth.key, Settings.facebook_auth.secret
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}