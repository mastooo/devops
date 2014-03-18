Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, '2af9f9b4dfa6762ba0a4', '426a71e9f4e7037c6cdb5d79360e8fc281460b63', scope: "user:email,repo,read:org"
end