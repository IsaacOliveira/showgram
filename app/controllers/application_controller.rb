class ApplicationController < ActionController::Base
  include InstagramSessionHelper
  protect_from_forgery with: :exception
end
