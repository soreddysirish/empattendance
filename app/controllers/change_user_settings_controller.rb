class ChangeUserSettingsController < ApplicationController
	 
  def edit
  	@current_user = current_employee.id
  end

  def update
  	if current_employee.valid_password?(params[:passwordchange][:currentPassword])
  		current_employee.update(password:params[:passwordchange][:password],
  			password_confirmation: params[:passwordchange][:password_confirmation])
  		sign_in(current_employee, :bypass => true)
      redirect_to '/'
  		flash[:success] ="Your password is updated successfully"
  	else
      redirect_to "edit"
  		flash[:warning] ="enter correct password"
  	end
  end
end

