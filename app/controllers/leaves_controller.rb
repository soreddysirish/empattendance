class LeavesController < ApplicationController
  def index
  	@leaves =current_employee.leaves
  	respond_to do |format|
  		format.html
  		format.json {render :json => @leaves}
  	end
  end

  def new
    @leave =Leave.new
  end

  def create
     if params.present?
      binding.pry
     	if  params[:leave][:leave_type] =="Casual leave"
     		color ="#9900CC"
        leaves_count = params[:leave][:num_of_days].to_i+1
        remain = params[:leave][:leaveBalance].to_i - leaves_count
        current_employee.update(available_leaves: remain)
      elsif params[:leave][:leave_type]== "Official out" 
        color ="blue"
      elsif params[:leave][:leave_type] == "sick leave"
        color ="red"
        leaves_count = params[:leave][:num_of_days].to_i+1
        remain = params[:leave][:leaveBalance].to_i - leaves_count
        current_employee.update(available_leaves: remain)
        end
       # @leave = 
       binding.pry 
        current_employee.leaves.create(
            month: Time.now.month,
            start: params[:leave][:start]+"T23:59:00",
            end: params[:leave][:end]+"T23:59:00",
            reason: params[:leave][:reason],
            leave_type: params[:leave][:leave_type],
            num_of_days: params[:leave][:num_of_days].to_i+1,color: color)
        # if @leave.present?
        #   respond_to do |format|
        #     binding.pry
        #     format.html {redirect_to action: :new}
        #     # format.json {render :json => @att}
        #   end
        # end
        redirect_to action: :new
        flash[:success] ="Your leave is success fully applied"
      end
  end

  def update
  end



end
