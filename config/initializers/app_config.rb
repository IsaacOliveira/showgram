CONFIG = YAML.load_file(Rails.root.join("config/app.yml"))[Rails.env]
module APP_CONFIG

  module INSTAGRAM
    APP_REDIRECT_URL = CONFIG['redirect_uri']
    GRANT_TYPE = 'authorization_code'
    CLIENT_SECRET = CONFIG['client_secret']
    CLIENT_ID = CONFIG['client_id']
    ACCESS_TOKEN_URL = "https://api.instagram.com/oauth/access_token"
  end
end