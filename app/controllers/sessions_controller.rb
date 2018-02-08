class SessionsController < ApplicationController

  def show
    user = LoginWithInstagramCode.new(params[:code]).execute
    redirect_to root_path
  end
end