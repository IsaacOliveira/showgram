class GetUserPictures

  def initialize(user)
    @service = InstagramPicturesService.new(user)
  end

  def execute
    media_data = @service.get_recent_media
    media_data.map{ | picture_data | Picture.new(picture_data) }
  end
end