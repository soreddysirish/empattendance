set :branch, 'master'
set :stage, :production
# Setting RAILS_ENV environment variable on server
set :rails_env, :production

set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}

role :app, %w{root@107.170.30.178}

set :ssh_options, {
  forward_agent: true,
  user: "root"
}


# set :application, "cmpayroll"
# set :stage, :production

# set :repo_url, "git@github.com:soreddysirish/empattendance.git"
# set :deploy_to, "/var/www/cmpayroll"
# set :scm, :git
# set :branch, "master"
# set :user,"root"
# set :use_sudo, false
# set :rails_env, "production"
# set :deploy_via, :copy
# set :ssh_options, { :forward_agent => true, :port => 3000 }
# set :keep_releases, 5
#default_run_options[:pty] = true
# server "107.170.30.178", :roles => [:app, :web, :db], :primary => true
# set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}
#role :app, %w{107.170.30.178}
# role :app, %w{root@107.170.30.178}
# role :web, %w{root@107.170.30.178}
# role :db,  %w{root@107.170.30.178}


# # Force rake through bundle exec
# SSHKit.config.command_map[:rake] = "bundle exec rake"

# # Force rails through bundle exec
# SSHKit.config.command_map[:rails] = "bundle exec rails"

# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       execute "chmod 777 -R #{release_path}/tmp"
#       execute "sudo service apache2 restart"
#       # execute "sudo touch #{File.join(current_path,'tmp','restart.txt')}"
#     end
#   end

#   after :finishing, 'deploy:restart'
#   after :finishing, 'deploy:cleanup'

#   # after :bundle, 'deploy:after_bundle'
# end 