class DashboardController < ApplicationController
	def show
		if(@current_user.organization_name.nil?)
			@organizations = @github.orgs.all
		end


	end
end
