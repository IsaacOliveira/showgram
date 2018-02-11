require 'rails_helper'

RSpec.describe User, type: :model do

  let(:access_token) { double }
  let(:username) { double }
  let(:profile_picture) { double }

  describe ".build_from_instagram_response" do
    let(:instagram_data){ { "access_token" => access_token, "user" => { "username" => username, "profile_picture" => profile_picture} }  }
    it "gets data from instagram response to initialize object" do
      expect(User).to receive(:new).with(access_token: access_token, username: username, profile_picture: profile_picture)
      User.build_from_instagram_response instagram_data
    end
  end

  describe ".build_from_session" do
    let(:session_data){ { "access_token" => access_token, "username" => username, "profile_picture" => profile_picture}  }

    it "gets data from session response to initialize object" do
      expect(User).to receive(:new).with(access_token: access_token, username: username, profile_picture: profile_picture)
      User.build_from_session session_data
    end
  end

  describe "#initialize" do
    it "sets the user attributes" do
      user = User.new access_token: access_token, username: username, profile_picture: profile_picture
      expect(user.access_token).to be access_token
      expect(user.username).to be username
      expect(user.profile_picture).to be profile_picture
    end
  end

  describe "#to_session" do

    it "create a json from attributes" do
      user = User.new access_token: access_token, username: username, profile_picture: profile_picture
      expect(user.to_session).to be == { access_token: access_token, username: username, profile_picture: profile_picture }
    end
  end

end