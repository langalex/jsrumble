default_run_options[:pty] = true
set :application, "jsrumble"
set :repository, "git@github.com:langalex/jsrumble.git"
set :scm, "git"
set :ssh_options, { :forward_agent => true }
set :use_sudo, false
set :domain, "jsrumble.com"
set :bindir, '/opt/ruby-enterprise-1.8.6-20081205/bin'
set :user, "admin"
set :rake, "#{bindir}/rake"

set :branch, "master"
set :deploy_via, :remote_cache

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, domain
role :web, domain
role :db,  domain, :primary => true

desc 'restart'
deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end

after "deploy:finalize_update", :roles => :app do
  run "ln -s #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
  
  run "ln -s #{deploy_to}/shared/git #{release_path}/db/git"
  
end


