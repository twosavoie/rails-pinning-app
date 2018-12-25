class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    @user ||= User.where("id=?",session[:user_id]).first
  end
  helper_method :current_user

  def require_login
    if !logged_in? 
      redirect_to :login
    end
  end

  def logged_in?
    !current_user.nil? && !current_user.id.nil?
  end
  helper_method :logged_in?
end
