class HomeController < ApplicationController
	layout 'home'
	skip_before_filter :require_user
  def show
  	redirect_to dashboard_url unless current_user.nil?
  end
end
