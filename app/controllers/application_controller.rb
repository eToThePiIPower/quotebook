class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:username, profile_attributes: [:about_me, :home_page, :location]])
    devise_parameter_sanitizer.permit(:account_update,
      keys: [profile_attributes: [:about_me, :home_page, :location]])
  end
end
