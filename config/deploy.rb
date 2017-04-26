set :application, 'cmpayroll'                       # application name
set :repo_url, 'git@github.com:soreddysirish/empattendance.git'   # your repo url
set :deploy_to, '/var/www/cmpayroll'
# set :scm, :git
set :keep_releases, 2
set :format, :pretty
set :log_level, :debug
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :stages, %w(production staging development)
set :default_stage, 'development'

# Force rake through bundle exec
SSHKit.config.command_map[:rake] = 'bundle exec rake'

# Force rails through bundle exec
SSHKit.config.command_map[:rails] = 'bundle exec rails'

set :migration_role, 'app' # Defaults to 'db'
set :assets_roles, [:app] # Defaults to [:web]

# Shared directories over different deployments
set :linked_dirs, %w(pids log)
set :linked_files, %w(config/database.yml)

namespace :deploy do
	desc 'Restart application'
	task :restart do
		on roles(:app), in: :sequence, wait: 5 do
			#execute "sudo chown -R  /var/www/cmpayroll/"
			execute "sudo service nginx restart"	
		end
	end


after :finishing, 'deploy:restart'
after :finishing, 'deploy:cleanup'
end

# # config valid only for current version of Capistrano
# set :application, "cmpayroll"
# set :repo_url, "git@github.com:soreddysirish/empattendance.git"
# set :deploy_to, "/var/www/cmpayroll"
# set :branch, "master"
# set :user,"root"
# set :stages, ["production"]
# set :default_stage, "production"
# set :linked_files, %w{config/database.yml}
# set :use_sudo, false
# set :rails_env, "production"
# set :deploy_via, :copy
# set :ssh_options, { :forward_agent => true, :port => 3000 }
# set :keep_releases, 5
# #default_run_options[:pty] = true
# # server "107.170.30.178", :app, :web, :db, :primary => true
# #set :scm_passphrase, "codingmart"
# #set :stages, %w(production staging development)
# #set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :linked_files, "config/database.yml", "config/secrets.yml"
# set :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
# #set :default_stage, "production"

# # namespace :deploy do

# #   desc 'Restart application'
# #   task :restart do
# #     on roles(:app), in: :sequence, wait: 5 do
# #       execute :touch, release_path.join('tmp/restart.txt')
# #     end
# #   end

# #   after :publishing, 'deploy:restart'
# #   after :finishing, 'deploy:cleanup'
# # end
# # Default branch is :master
# # ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# # Default deploy_to directory is /var/www/my_app_name
# # set :deploy_to, "/var/www/my_app_name"

# # Default value for :format is :airbrussh.
# # set :format, :airbrussh

# # You can configure the Airbrussh format using :format_options.
# # These are the defaults.
# # set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# # Default value for :pty is false
#  set :pty, true
#  set :log_level, :debug

# # Default value for :linked_files is []
# # append :linked_files, "config/database.yml", "config/secrets.yml"

# # Default value for linked_dirs is []
# # append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# # Default value for default_env is {}
# # set :default_env, { path: "/opt/ruby/bin:$PATH" }

# # Default value for keep_releases is 5
#  set :keep_releases, 5
