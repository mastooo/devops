class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :require_user
  
  def require_user
    unless current_user
      store_location
      redirect_to home_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



end
