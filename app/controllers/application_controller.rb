class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, if: :user_auth?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :blog_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :blog_url])
  end

  def user_auth?
    unless controller_name == 'blogs' && action_name == 'index'
      true
    end
  end
end
