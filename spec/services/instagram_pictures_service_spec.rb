require 'rails_helper'

RSpec.describe InstagramPicturesService, type: :model do

  before do
    stub_const("APP_CONFIG::INSTAGRAM::CLIENT_SECRET", client_secret)
    stub_const("APP_CONFIG::INSTAGRAM::CLIENT_ID", client_id)
  end

  describe "#initialize" do
    let(:client_secret){ double }
    let(:client_id){ double }
    let(:access_token){ double }
    let(:user){ instance_double("User", access_token: access_token) }

    it "initialize instagram api"
  end

  describe "#get_recent_media" do
    let(:client_secret){ double }
    let(:client_id){ double }
    let(:instagram_user){ double }
    let(:user){ instance_double("User", access_token: access_token) }
    let(:instagram_media){ spy }

    it "calls the instagram api" do
      allow(InstagramApi).to receive(:config)
      expect(InstagramApi).to receive(:user).and_return(instagram_user)
      expect(instagram_user).to receive(:recent_media).and_return(instagram_media)

      InstagramPicturesService.new(double).get_recent_media
    end
  end
end