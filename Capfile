# Load DSL and set up stages
require "capistrano/deploy"
require "capistrano/setup"
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'

# Include default deployment tasks
#require "capistrano/setup"

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require 'capistrano/rbenv'
# require 'capistrano/chruby'

 require 'capistrano/passenger'
  require "capistrano/scm/git"
    install_plugin Capistrano::SCM::Git


# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }