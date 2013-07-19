Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook_auth.key, Settings.facebook_auth.secret
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

# OmniAuth.config.on_failure do |env|
#   puts 'HIHIHIHIHIHI'
#   puts 'HIHIHIHIHIHI'
#   puts 'HIHIHIHIHIHI'
#   puts 'HIHIHIHIHIHI'
#   message_key = env['omniauth.error.type']
#   puts message_key
#   origin_query_param = env['omniauth.origin'] ? "&origin=#{CGI.escape(env['omniauth.origin'])}" : ""
#   puts origin_query_param
#   strategy_name_query_param = env['omniauth.error.strategy'] ? "&strategy=#{env['omniauth.error.strategy'].name}" : ""
#   puts strategy_name_query_param
#   # extra_params = env['omniauth.params'] ? "&#{env['omniauth.params'].to_query}" : ""
#   puts env['omniauth.params'] ? "&#{env['omniauth.params'].to_query}" : ""
#   puts 'BYEBYEBYE'
#   puts 'BYEBYEBYE'
#   puts 'BYEBYEBYE'
#   puts 'BYEBYEBYE'
#   # new_path = "/auth_failure?message=#{message_key}#{origin_query_param}#{strategy_name_query_param}#{extra_params}"

#   OmniAuth::FailureEndpoint.new(env).redirect_to_failure
# end