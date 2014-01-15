Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV.fetch('GITHUB_KEY', '65e4aea57e4d5f221c77'), ENV.fetch('GITHUB_SECRET', '2882f4b72369d61bb5060d5a947b65bb36a15c52')
end
