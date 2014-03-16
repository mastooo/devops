require 'jobs/commit_retrieve_job.rb'

module Api
	class DeploymentsController < ApiController

		def show
    		@deployment = Deployment.find_by_id(params[:id])
  		end
		
		def create
			puts params.inspect
			deployment = Deployment.new
			deployment.commit_hash = params[:deployment][:commit_hash]
			deployment.user = @current_user
			deployment.save!
			post_job @current_user.id, deployment.commit_hash
			render json: deployment
		end


		private 

		def post_job (user_id, commit_hash)
			Resque.enqueue(CommitRetrieveJob, user_id, commit_hash)
		end
	end
end
