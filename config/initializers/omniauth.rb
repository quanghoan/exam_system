OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '212104499131665','f83890f55afc58987d51f44bebbc529b', :display => "popup"
end