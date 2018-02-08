class LoginWithInstagramCode

  def initialize(code)
    @service = InstagramAccessTokenService.new(code)
  end

  def execute
    response = @service.request_token
    User.build_from_instagram_response(response)
  end
end