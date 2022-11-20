
#require 'lib/heanet_common.rb'

$application = 'pasta'

set :application, $application
set :repository,  "svn+ssh://riccardo@svn.goliardia.it/var/svn/ricdev/projects/#{$application}/"
set :apache_conf_path, "/etc/apache2/sites-enabled/"
set :deploy_to, "/var/www/capistrano/#{application}/"
set :try_sudo, false
set :use_sudo, false
set :keep_releases, 6    # for cleanup

server "riccardo@dev.palladius.eu", :app, :web, :db, :primary => true
#server "riccardo@bushmill.palladius.eu", :app, :web, :db, :secondary => true

	# If you are using Passenger mod_rails uncomment this:
	# if you're still using the script/reapear helper you will need
	# these http://github.com/rails/irs_process_scripts
namespace :deploy do
  task :start do  
  end
  task :stop do
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end


# copied from Recipe 76 pag399 Advanced Rails Reecipes (yuppie)
namespace :assets do #                      release , shared
  def remove_and_symlink(original,destination=nil)
    destination ||= original
    run <<-CMD
      rm -rf  #{release_path}/#{original} &&
      ln -nfs #{shared_path}/#{destination}  #{release_path}/#{original} &&
      echo OK remove_and_symlink on `hostname`
    CMD
  end

  task :symlink, :roles => :app do
    assets.create_dirs
    # Ric, clean this up with sth like:
    # cmd_rm_link "/public/images/uploads/", "/images_uploads/"
    # cmd_rm_link "/db/development.sqlite3"   # dflt to $1 :)
    puts "Making absolute path for photo uploads and devel.sqlite (see recipe 76)"
    # Prova a usare il remove_and_symlink('db/prodiuction.sqlite3')
    run <<-CMD
      rm -rf  #{release_path}/db/production.sqlite3 &&
      ln -nfs #{shared_path}/db/production.sqlite3  #{release_path}/db/production.sqlite3
    CMD

    # Change remotely DB
    #run <<-CMD
    #  echo Keyval.capistrano_update 'DEVE deploy.rb #{ARGV.join ' '}' | #{release_path}/script/console development"
    #  echo Keyval.capistrano_update 'PROD deploy.rb #{ARGV.join ' '}' | #{release_path}/script/console production"
    #CMD
    
  end

  task :create_dirs, :roles => :app do
    %w( images_uploads/ db/ ).each do |name|
      run "mkdir -p #{shared_path}/#{name}"
    end
  end

  after "deploy:update_code", "assets:symlink" # the symlinking is done after the code is deployed
	after "deploy", "deploy:migrations" # migra DB, vedi: http://www.mail-archive.com/capistrano@googlegroups.com/msg03611.html

    # trovato da qualche parte, qui e' inutile ma concettualmente puoi dire fai sudo ovunque ma disattivalo prima del cleanup. Fico no??
  before("deploy:cleanup") { set :use_sudo, false }
	after "deploy", "deploy:cleanup"  # trocato su inet per fare pulizia
  # create_dirs was created cos it COULD be created upon setup, if u want. Like that, its just yet annother unuseful funccall
end
