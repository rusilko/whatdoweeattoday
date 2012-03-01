$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "whatdoweeattoday"
set :repository, "git@github.com:LunarLogicPolska/whatdoweeattoday.git"
set :scm, :git
set :deploy_to, "/var/www/whatdoweeattoday"
set :use_sudo, false
set :keep_releases, 3
set :rails_env, "production"

server "rubydev@hydra.llp.pl", :app, :web, :db, :primary => true

namespace :deploy do
  desc "restarts application server(s)"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
