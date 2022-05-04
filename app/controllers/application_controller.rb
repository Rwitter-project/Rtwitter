class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || posts_path
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || posts_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :description, :first_name , :last_name, :location])
    devise_parameter_sanitizer.permit(:account_update , keys: [:description,:location])
  end
end
