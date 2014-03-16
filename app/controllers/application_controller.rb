class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :require_user, :set_github
  
  def require_user
    unless current_user
      store_location
      redirect_to home_url
      return false
    end
  end

  def set_github
	@github = Github.new oauth_token: @current_user.token unless current_user.nil?
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def current_user
	begin
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
	session[:user_id] = nil
	@current_user = nil
    end
  end



end
