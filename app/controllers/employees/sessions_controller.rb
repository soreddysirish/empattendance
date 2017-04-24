class Employees::SessionsController < Devise::SessionsController
 #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  #   binding.pry
  # end

  # POST /resource/sign_in
  def create
    super
    if resource.save
       flash.delete(:notice)
      flash[:success] ="You are successfully login"
      end
  end

  # DELETE /resource/sign_out
  def destroy
    super
    flash.delete(:notice)
    flash[:success] ="You are successfully Logout"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
