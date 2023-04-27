class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token  
  before_action :configure_permitted_parameters, if: :devise_controller?
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
      elsif current_user.has_role? :sales_person
        leads_path
      elsif current_user.has_role? :manager
        manager_dashboard_interview_schedules_path
      else
        candidates_path
      end
    end
    protected
    def configure_permitted_parameters
      added_attrs = [:email,:name, :mobile, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
