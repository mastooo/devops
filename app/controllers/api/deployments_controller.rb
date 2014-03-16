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
			render json: deployment
		end
	end
end
