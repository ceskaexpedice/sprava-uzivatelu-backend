Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_client_id'], ENV['google_client_secret'], skip_jwt: true
  provider :facebook, ENV['facebook_app_id'], ENV['facebook_app_secret'], scope: 'public_profile,email'
end