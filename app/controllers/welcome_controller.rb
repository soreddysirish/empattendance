class WelcomeController < ApplicationController
  def index
  	@attendances = current_employee.attendances.all
       @check_finder =current_employee.attendances.find_by(login_day: Time.now.day)
  end
end
