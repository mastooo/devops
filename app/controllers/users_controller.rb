class UsersController < ApplicationController
	skip_before_filter :require_user

	def update
		user = current_user
		github_orgnization = @github.orgs({:login => user.organization_name})

		user.update_attributes(params[:user].permit([:organization_name, :name, :email, :image]))
		user.organization_id = github_orgnization.login
		user.save!
		redirect_to home_url
	end
end
