class DashboardController < ApplicationController
	def show
		if(@current_user.organization_name.nil?)
			organizations = @github.orgs.all
			@orgs = {}

			organizations.each  do |org|
				@orgs[org.login] = @github.repos(org: org.login).list(type: 'private').map { |e|  e.name}
			end

			# for now, I just put the first repo of the first organization as the one used
			@current_user.organization_name = @orgs.keys.first
			@current_user.organization_id = @orgs.keys.first
			@current_user.repo= @orgs[@orgs.keys.first][0]
			@current_user.save!
		end
	end
end