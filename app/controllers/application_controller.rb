class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :description, :first_name , :last_name, :location])
    devise_parameter_sanitizer.permit(:edit_user_registration_path, keys: [:username, :description, :first_name , :last_name, :location])
  end
end
