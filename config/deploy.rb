require 'capistrano/ext/multistage'
# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'ruby_learning'
#set :repo_url, 'git@example.com:me/my_repo.git'
set :scm, :git
set :repository, git@github.lo.mixi.jp:JunChen/ruby_learning.git
set :scm_passphrase, ""
set :deploy_via, :remote_cache

set :user, "deploy_user"

set :stages, ["staging", "production"]
set :default_stage, "staging"
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
namespace :deploy do
  task :restart, :roles => :web do
    run "touch #{ current_path }/tmp/restart.txt"
  end

  task : restart_daemons, :roles => :app do
    sudo "monit restart all -g daemons"
  end

end

after "deploy", "deploy:restart_daemons"
