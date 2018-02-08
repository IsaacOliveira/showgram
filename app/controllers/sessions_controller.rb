class SessionsController < ApplicationController

  def show
    user = LoginWithInstagramCode.new(params[:code]).execute
    log_in(user)
    redirect_to root_path
  end

  def destroy
    redirect_to root_path
  end
end