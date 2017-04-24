class ApplicationController < ActionController::Base

	before_action :authenticate_employee!
   protect_from_forgery with: :null_session
   before_action :configure_permitted_parameters, if: :devise_controller?
   # skip_before_filter :load_and_authorize_resource

def current_ability
  @current_ability ||= Ability.new(current_employee)
end
 protected
 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,:firstName,:lastName,:empId,:address,:gender,:mobileNumber,:designation,
    	:dob,:doj,:pfNumber,:panNumber,:accountNumber,:bankName,:branch,:ifscCode,:accountType) }
  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email,:password)}
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation,:firstName,:lastName,:empId,:address,:gender,:mobileNumber,:designation,
    	:dob,:doj,:pfNumber,:panNumber,:accountNumber,:bankName,:branch,:ifscCode,:accountType)}
end
end