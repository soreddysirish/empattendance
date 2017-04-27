class AttendancesController < ApplicationController
  attr_accessor :employee
  def index
    @employee_id  = employee.id
    attendances = employee.attendances.all
    @check_finder =employee.attendances.find_by(login_day: Time.now.day)
    leaves = employee.leaves
    @attendances =leaves+attendances
    respond_to do |format|
      format.html
      format.json {render :json => @attendances}
    end
  end

  def new
  	@attendance =employee.attendances.find_by(loginDay:Time.now.day) 
  end

  def create
   @attendance =employee.attendances.find_or_create_by(login_day:Time.now.day,start:Time.now,month: Time.now.month)
   respond_to do |format|
    format.html { redirect_to action: :index,employee_id:employee.id}
  end
end

def update
 attendance =employee.attendances.find_by(login_day:Time.now.day)
 attendance.update(end: Time.now)
 respond_to do |format|
  format.html { redirect_to action: :index,employee_id:employee.id}
end
end

def destroy
end

def view_employee_reports
  @employees  = Employee.all
end

def list_view
  @employee = Employee.find(params[:id])
  @attendances = @employee.attendances.find_by(month:Time.now.month)
  @leaves =@employee.leaves.find_by(month: Time.now.month)
end

def view_payslip_report
  @employee =Employee.find(params[:id])
  @reports = @employee.reports
  if @reports.present?
    if params.present? && params[:month].present?
      @first_month_report =@reports.find_by(month: params[:month])
      @months =@reports.pluck(:month).uniq
    else
      @first_month_report = @reports.first
      @months =@reports.pluck(:month).uniq
    end
    respond_to do |format|
      format.html
      format.json {render :json =>  @first_month_report }
      format.pdf do
       @pdfmonthreport =@reports.find_by(month: params[:month])
       @pdf = render_to_string :pdf => "employee",
       encoding: "UTF-8",
       template: "attendances/showpdf.pdf.erb",
       locals: {:employee => @employee,:reports => @pdfmonthreport}
       send_data(@pdf, :filename => "employee",  :type=>"application/pdf")
     end
   end
 else
  if current_employee.role == "admin" || current_employee.role == "superadmin"
  redirect_to  registernewemployees_index_path
  flash[:warning] = "your payslip is not generated"
else
  redirect_to '/'
  flash[:warning] = "your payslip is not generated"
end
end
end
    

private
def employee
  @employee =Employee.find(params[:employee_id])
end
end
