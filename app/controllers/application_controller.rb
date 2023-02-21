class ApplicationController < ActionController::Base
  
  
  skip_before_action :verify_authenticity_token  
    rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
         redirect_to "/"
    end

    rescue_from ActionController::RoutingError do
      flash[:error] = 'Access denied!'
       redirect_to "/"
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role? :admin
      admin_root_path
    else
      candidates_path
    end
  end
end
