class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  attr_accessor :username, :login
  #layout :layout_by_resource
  #include SimpleCaptcha::ControllerHelpers
 # before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :check_perfile, if: :devise_controller?

  protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
    	redirect_to root_url, :alert => exception.message
 	end
  
  #before_action :configure_sign_up_params, if: :devise_controller?
 # before_action :configure_account_update_params, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :username
    #devise_parameter_sanitizer.for(:account_update) << :username
    #devise_parameter_sanitizer.for(:sign_up) << :username
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :username,:captcha, :captcha_key, :terms, roles: []) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me, :username,:captcha, :captcha_key) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :username, :captcha, :captcha_key,:admin , roles: []) }
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  end

  def layout_by_resource
  if resource_name == :home
    "home"
  else
    "application"
  end
  end
  # You can put the params you want to permit in the empty array.
  #def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
     # devise_parameter_sanitizer.for(:sign_up) << :username
  #end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
    #  devise_parameter_sanitizer.for(:account_update) << :username
  # end
end
