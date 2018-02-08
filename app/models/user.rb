class User

  attr_accessor :access_token, :username, :profile_picture

  def self.build_with_instagram_response(response)
    user_data = response["user"]
    self.new(access_token: response["access_token"], username: user_data["username"], profile_picture: user_data["profile_picture"])
  end

  def initialize(access_token:, username:, profile_picture:)
    @access_token = access_token
    @username = username
    @profile_picture = profile_picture
  end

end