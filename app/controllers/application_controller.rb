class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user ? true : false
  end

  def require_user
    return if logged_in?

    flash[:danger] = 'You must be logged in to perform this acction'
    redirect_to login_path
  end
end
