class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token  
    rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
        redirect_to root_url
    end
end
