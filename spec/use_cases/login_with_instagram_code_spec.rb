require 'rails_helper'

RSpec.describe LoginWithInstagramCode, type: :model do

  let(:code){ double }

  describe "#initialize" do

    it "initializes the service" do
      expect(InstagramAccessTokenService).to receive(:new).with(code)
      LoginWithInstagramCode.new(code)
    end
  end

  describe "#execute" do
    let(:service){ instance_double("InstagramAccessTokenService")}
    let(:response){ double }
    it "request the token from service" do
      allow(InstagramAccessTokenService).to receive(:new).and_return(service)
      expect(service).to receive(:request_token)
      allow(User).to receive(:build_from_instagram_response)
      LoginWithInstagramCode.new(code).execute
    end

    it "builds the user from response" do
      allow(InstagramAccessTokenService).to receive(:new).and_return(service)
      allow(service).to receive(:request_token).and_return(response)
      expect(User).to receive(:build_from_instagram_response).with(response)
      LoginWithInstagramCode.new(code).execute
    end
  end
end