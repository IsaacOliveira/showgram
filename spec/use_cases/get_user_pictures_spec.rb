require 'rails_helper'

RSpec.describe GetUserPictures, type: :model do

  let(:user){ instance_double("User")}
  describe "#initialize" do
    it "initialize pictures service" do
      expect(InstagramPicturesService).to receive(:new).with(user)
      GetUserPictures.new(user)
    end
  end

  describe "#execute" do
    let(:service){ instance_double("InstagramPicturesService")}
    let(:medias_spy){ spy }
    let(:media1){ double }
    let(:media2){ double }
    let(:medias){ [:media1, :media2] }

    it "gets the pictures data from service" do
      allow(InstagramPicturesService).to receive(:new).and_return(service)
      expect(service).to receive(:get_recent_media).and_return(medias_spy)
      GetUserPictures.new(user).execute
    end

    it "maps the data to model" do
      allow(InstagramPicturesService).to receive(:new).and_return(service)
      allow(service).to receive(:get_recent_media).and_return(medias)
      expect(Picture).to receive(:new).once.with(:media1)
      expect(Picture).to receive(:new).once.with(:media2)
      GetUserPictures.new(user).execute
    end
  end
end