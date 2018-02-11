require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe "#initialize" do
    let(:image_url) { double }
    let(:date) { double }
    let(:location) { double }
    let(:picture_data){ { image_url: image_url, date: date, location: location}  }

    it "sets the attributes from data" do
      picture = Picture.new picture_data
      expect(picture.image_url).to be image_url
      expect(picture.date).to be date
      expect(picture.location).to be location
    end
  end
end