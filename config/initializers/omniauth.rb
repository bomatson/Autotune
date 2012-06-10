Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  if Rails.application.config.respond_to? :twitter
    provider :twitter, Rails.application.config.twitter[:key], Rails.application.config.twitter[:secret]
  end

  OmniAuth::Configuration.instance.on_failure = OmniAuthFailureEndpoint
end

class OmniAuthFailureEndpoint < OmniAuth::FailureEndpoint
  def call
    Rack::Response.new(["302 Moved"], 302, 'Location' => "/sessions/failure?#{env['QUERY_STRING']}").finish
  end
end


