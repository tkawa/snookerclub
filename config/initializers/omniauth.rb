Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :developer unless Rails.env.production?
  provider :facebook, Settings.facebook_app_id, Settings.facebook_app_secret
  provider :twitter, Settings.twitter_key, Settings.twitter_secret
end
