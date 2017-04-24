class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :firstName, :lastName,presence: true, length: {maximum: 8}

  has_many :attendances
  has_many :leaves
  has_one :salary
  has_many :reports
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  ROLES= %w[admin superadmin].freeze


  def self.update_available_leaves
    @employee =Employee.all
    @employee.each do |e|
      e.available_leaves +=2
      e.save
      unless !e.salary.present?
        check_in_days = e.attendances.where(:month=>Time.now.month).count
        leaves_count = e.leaves.where(:month=>Time.now.month).pluck(:num_of_days).reduce(:+)
        total_days = (check_in_days.to_i) + (leaves_count.to_i)
        d = Date.today-2
        working_days = (d.at_beginning_of_month..d.at_end_of_month).count {|day| !day.saturday? && !day.sunday? }
        base = e.salary
        totDeductions =  base.pf + base.ProfTax
        totEarnings = base.basicSal + base.hra + base.ta + base.medicalAllowances + base.residualPay - totDeductions
        monthly_days = Time.days_in_month(Time.now.month-1,Time.now.year)
        per_day_salary = (totEarnings/monthly_days).to_f
        lop_deductions = 0
        lop_count = 0
        if working_days == total_days
          lop_count = e.leaves.find_by(:month=>Time.now.month-1, :leave_type=>"Loss of pay").num_of_days
          if lop_count.present?
            lop_deductions =lop_count*per_day_salary 
          end
          net_pay = totEarnings - lop_deductions
        else
          net_pay = totEarnings-((working_days-total_days) * per_day_salary)
        end
        effectiveWorkDays = monthly_days - (working_days - total_days) - lop_count
        report = e.reports.find_or_initialize_by(month: Time.now.month)
        report.basic = base.basicSal
        report.hra = base.hra
        report.ta =  base.ta
        report.ma = base.medicalAllowances
        report.pf = base.pf
        report.residuapay = base.residualPay
        report.profTax = base.ProfTax
        report.totEarnings = totEarnings
        report.totDeductions = totDeductions
        report.lop = lop_count
        report.daysInMonth = monthly_days
        report.effectiveWorkDays = effectiveWorkDays
        report.netPay = net_pay
        report.save
      end
    end
  end

  def self.auto_checkout
    @employee =Employee.all
    @employee.each do |e|
      check_the_day = e.attendances.find_by(login_day: Time.now.day)
      if check_the_day.present?
        unless check_the_day.end.present?
         check_the_day.update(:end=>Time.now)
       end
     end 
   end
 end
end

#to update cron tab
   # whenever --update-crontab







