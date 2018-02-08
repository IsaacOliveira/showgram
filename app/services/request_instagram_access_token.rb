class RequestInstagramAccessToken

  def initialize(code)
    @code = code
  end

  def request
    params = {code: @code,
              redirect_uri: APP_CONFIG::INSTAGRAM::APP_REDIRECT_URL,
              grant_type: APP_CONFIG::INSTAGRAM::GRANT_TYPE,
              client_secret: APP_CONFIG::INSTAGRAM::CLIENT_SECRET,
              client_id: APP_CONFIG::INSTAGRAM::CLIENT_ID
            }
    response = Net::HTTP.post_form(URI(APP_CONFIG::INSTAGRAM::ACCESS_TOKEN_URL), params)
    JSON.parse(response.body)
  end
end