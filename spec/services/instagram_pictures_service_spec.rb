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
    let(:config_double){ double }

    it "initialize instagram api" do
      allow(InstagramApi).to receive(:config).and_yield(config_double)
      expect(config_double).to receive(:client_id=).with(client_id)
      expect(config_double).to receive(:client_secret=).with(client_secret)
      expect(config_double).to receive(:access_token=).with(access_token)

      InstagramPicturesService.new(user)
    end
  end

  describe "#get_recent_media" do
    let(:client_secret){ double }
    let(:client_id){ double }
    let(:instagram_user){ double }
    let(:access_token){ "test_token" }
    let(:user){ instance_double("User", access_token: access_token) }
    let(:instagram_media_spy){ spy }

    it "calls the instagram api" do
      allow(InstagramApi).to receive(:config)
      expect(InstagramApi).to receive(:user).and_return(instagram_user)
      expect(instagram_user).to receive(:recent_media).and_return(instagram_media_spy)

      InstagramPicturesService.new(double).get_recent_media
    end

    it "maps the pictures with the mocked response" do
      stub_request(:get, "https://api.instagram.com/v1/users/self/media/recent?access_token=#{access_token}").
         with(  headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body:  Pathname.new(Rails.root.join('spec/support/instagram_response')), headers: {})

      pictures_data = InstagramPicturesService.new(user).get_recent_media
      expected_pictures = [{:image_url=>
                              "https://scontent.cdninstagram.com/vp/745e4d908f1093d79a01addcf6da972d/5B0E84FC/t51.2885-15/s640x640/sh0.08/e35/27576932_1597044727047521_3466138556055945216_n.jpg",
                             :date=>DateTime.strptime("1518144045",'%s'),
                             :location=>"Pipa, Rio Grande Do Norte, Brazil"},
                            {:image_url=>
                              "https://scontent.cdninstagram.com/vp/49ffbf414ebc18d72492c1058cd83630/5B1F83ED/t51.2885-15/s640x640/sh0.08/e35/27576874_159971007991148_469379387888762880_n.jpg",
                             :date=>DateTime.strptime("1518143935",'%s'),
                             :location=>"Jericoacoara - O Paraíso do Brasil"}]
      expect(pictures_data).to eq expected_pictures
    end
  end
end