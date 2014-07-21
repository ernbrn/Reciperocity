Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flickr, '335f0d5ed8f669ea6fae7c74cce51ccf', 'b57164da220d801a'
end
