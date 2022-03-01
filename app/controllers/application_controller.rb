class ApplicationController < ActionController::Base
  before_action :request_headers
  protect_from_forgery with: :null_session
  before_action :update_allowed_parameters, if: :devise_controller?


  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :image, :phone, :is_driver, :is_admin, :store_id,
               :city_id)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation,
               :current_password, :image, :phone, :is_driver, :is_admin,
               :store_id, :city_id)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(email, :password)
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    puts 'hello world'
    new_user_session_path
  end

  def request_headers
    puts request.headers.all? { |k, v| puts "#{k}: #{v}" };
  end
end
