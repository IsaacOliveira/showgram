module APP_CONFIG

  module INSTAGRAM
    APP_REDIRECT_URL = ENV['REDIRECT_URL']
    GRANT_TYPE = 'authorization_code'
    CLIENT_SECRET = ENV['CLIENT_SECRET']
    CLIENT_ID = ENV['CLIENT_ID']
    ACCESS_TOKEN_URL = "https://api.instagram.com/oauth/access_token"
    AUTHORIZE_URL = "https://www.instagram.com/oauth/authorize/?client_id=#{CLIENT_ID}&redirect_uri=#{APP_REDIRECT_URL}&response_type=code"
  end
end