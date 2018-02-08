class Picture

  attr_accessor :image_url, :date, :location

  def initialize(picture_data)
    @image_url = picture_data[:image_url]
    @date = picture_data[:date]
    @location = picture_data[:location]
  end

end