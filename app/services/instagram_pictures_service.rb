class InstagramPicturesService

  def initialize(user)
    InstagramApi.config do |config|
      config.access_token = user.access_token
      config.client_id = APP_CONFIG::INSTAGRAM::CLIENT_ID
      config.client_secret = APP_CONFIG::INSTAGRAM::CLIENT_SECRET
    end
  end

  def get_recent_media
    InstagramApi.user.recent_media["data"].map{ | picture | map_media(picture) }
  end

  private
  def map_media(picture)
    { image_url: picture.dig("images", "standard_resolution", "url"),
      date: DateTime.strptime(picture.created_time,'%s'),
      location: picture.dig("location", "name") }
  end
end

