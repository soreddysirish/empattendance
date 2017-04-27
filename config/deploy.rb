set :application, 'cmpayroll'                       # application name
set :repo_url, 'git@github.com:soreddysirish/empattendance.git'   # your repo url
set :deploy_to, '/var/www/cmpayroll'
# set :scm, :git
set :keep_releases, 2
set :format, :pretty
set :log_level, :debug
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :stages, %w(development production staging)
set :default_stage, 'development'


SSHKit.config.command_map[:rake] = 'bundle exec rake'

# Force rails through bundle exec
SSHKit.config.command_map[:rails] = 'bundle exec rails'

set :migration_role, 'app' 
set :assets_roles, [:app] 

set :linked_dirs, %w(pids log)
set :linked_files, %w(config/database.yml)
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do
	desc 'Restart application'
	task :restart do
		on roles(:app), in: :sequence, wait: 5 do
			execute "sudo service nginx restart"	
		end
	end
	task :update_cron do
		on roles(:app) do
			within current_path do
				execute "rm -rf tmp"
				execute "mkdir tmp"
				execute "chmod -R 777 #{current_path}/tmp"
				execute :bundle, :exec, "whenever --update-crontab #{fetch(:application)}"
			end
		end
	end

	after :finishing, 'deploy:update_cron'
	after :finishing, 'deploy:restart'
	after :finishing, 'deploy:cleanup'
end


