class HomeController < ApplicationController

  def index
    if logged_in?
      @user = current_user
      @pictures = GetUserPictures.new(@user).execute
    else
      @url = APP_CONFIG::INSTAGRAM::AUTHORIZE_URL
    end
  end


end