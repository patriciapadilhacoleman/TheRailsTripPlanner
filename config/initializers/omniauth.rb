OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1348859008585813'], ENV['0557be1b0d30fd6db1bb9885e3ab43fd']
end
