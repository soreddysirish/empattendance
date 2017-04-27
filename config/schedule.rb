# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
set :path, Rails.root

set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every '5 1 1 * *' do 
#every 2.minutes do 
	runner 'Employee.update_available_leaves'
end

#every :day, :at => '11:55:pm' do
#every 2.minutes do
every '55 23 * * *' do 
	runner 'Employee.auto_checkout'
end
