class SalariesController < ApplicationController

  def index
      @employees =Employee.all
      @salaries =Salary.all
  end

  def new
    @employee =Employee.find_by(id:params[:employee_id])
     @salary = @employee.salary
    unless @salary.present?
      @salary =  @employee.build_salary
    end
  end

  def create
   create_or_update_employee
    
  end

  def salary_report
    @employees =Employee.all
    @employees.each do |e|
      all_attendances = e.attendances.where(:month=>Time.now.month-1).count
      all_leaves = e.leaves.where(:month=>Time.now.month-1).pluck(:num_of_days).reduce(:+)
    end
  end

  def update
    create_or_update_employee
  end

  private
  def salary_params
    params.require(:salary).permit(:id,:basicSal,:hra,:ta,:medicalAllowances,:residualPay,:pf,:ProfTax)
  end
  # def employee
  #   binding.pry
  #   @employee = 
  #   redirect_to root_path and return unless @employee.present?
  # end

  def create_or_update_employee
     employee =Employee.find_by(id:params[:employee_id])
    if employee.salary.present?
      employee.salary.update_attributes(salary_params)
    else
      salary = employee.create_salary(salary_params) 
    end
    redirect_to   registernewemployees_index_path
  end
end
