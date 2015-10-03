class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  force_ssl if: :ssl_configured?
  
  def ssl_configured?
     Rails.env.production?
  end
  include AuthenticationHelper
  include CanCan::ControllerAdditions

  private 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
