module Api
  class ApiController < ActionController::Base
    respond_to :json

    helper_method :current_user
    skip_before_filter :verify_authenticity_token
    before_filter :require_user
    
    def require_user
      unless current_user
        return false
      end
    end

    def current_user
        @current_user = User.where(:api_token => params[:token]).first
        auth_error if @current_user.nil?
    end

    def auth_error
      respond_to do |format|
        format.json { render :text => '{"error": "authentication error"}', :status => :unauthorized }
      end
    end
  end
end