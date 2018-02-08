class LoginWithInstagramCode

  def initialize(code)
    @code = code
  end

  def execute
    response = RequestInstagramAccessToken.new(@code).request
    User.build_from_instagram_response(response)
  end
end