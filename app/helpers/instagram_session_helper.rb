module InstagramSessionHelper

  def log_in(user)
    session[:user_session] = user.to_session
  end

  def current_user
    @current_user ||= User.build_from_session(session[:user_session])
  end

  def logged_in?
    session[:user_session].present?
  end

  def log_out
    session.delete(:user_session)
  end

end
