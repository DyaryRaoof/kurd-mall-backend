class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    before_action :update_allowed_parameters, if: :devise_controller?
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :image, :phone, :is_driver, :is_admin) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :image, :phone, :is_driver, :is_admin) }
    end

    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
end
