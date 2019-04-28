OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1348859008585813'], ENV['FACEBOOK_SECRET']
end
