class RegisternewemployeesController < ApplicationController

  def index 
   @employees =Employee.all
   respond_to do |format|
    format.html
    format.json {render :json => @employees}
  end
end

def new
  @registeremp =Employee.new
end

def create
  @registeremp = Employee.create(employee_params)
  if @registeremp.save
    redirect_to action: :index
  else
    render 'new'
  end
end

def show
end

def edit
  @registeremp = Employee.find(params[:id])
end

def update
  @registeremp =  Employee.find(params[:id])
  if  @registeremp.update(employee_params)
    sign_in(current_employee, :bypass => true)
    flash[:success] ="account updated successfully"
     redirect_to action: :index
  else
    render "edit"
    flash[:warning] ="please provide all information including password"
  end
end

def destroy
 @employee=Employee.find(params[:id])
 @employee.destroy
 redirect_to registernewemployees_path
end

private
def employee_params
  params.require(:registeremp).permit(:email, :password, :password_confirmation,:firstName,:lastName,:empId,:address,:gender,:mobileNumber,:designation,
   :dob,:doj,:pfNumber,:panNumber,:accountNumber,:bankName,:branch,:ifscCode,:accountType,:role)
end
end
