class HomeController < ApplicationController

  def index
    @url = APP_CONFIG::INSTAGRAM::AUTHORIZE_URL
  end


end