class LoginWithInstagramCode

  def initialize(code)
    @code = code
  end

  def execute
    response = InstagramAccessTokenService.new(@code).request_token
    User.build_from_instagram_response(response)
  end
end