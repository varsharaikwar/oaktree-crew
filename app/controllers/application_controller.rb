class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token  
    rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
         redirect_to "/"
    end
    def after_sign_in_path_for(resource)
      candidates_path# your path
    end
end
