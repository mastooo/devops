class SessionsController < ApplicationController
	skip_before_filter :require_user

	def create
		user = User.from_github(request.env['omniauth.auth'])
		session[:user_id] = user.id
		redirect_to dashboard_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to home_url
	end
end
