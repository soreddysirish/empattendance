namespace :availableLeaves do
	desc "upding leaves" 
	task :update_leaves do
		@employees  = Employee.all
		@employees.each do |emp|
			emp.available_leaves +=2
			emp.save
		end
	end
end