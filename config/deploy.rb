###### START DEPLOY.RB ######

# Your cPanel/SSH login name

set :user , "gamebkco"



# The domain name of the server to deploy to, this can be your domain or the domain of the server.

set :server_name, "gameb00k.com"



# Your svn / git login name

set :scm_username , "vanmichael"

set :scm_password, Proc.new { CLI.password_prompt "SVN Password: "}



# Your repository type, by default we use subversion. 

#set :scm, :subversion



# If you are using git, uncomment the following line and comment out the line above.

set :scm, :git



# The name of your application, this will also be the folder were your application 

# will be deployed to

set :application, "van_app"



# the url for your repository

set :repository,  "https://github.com/vanmichael/van_app.git"





###### There is no need to edit anything below this line ######

set :deploy_to, "/home/#{user}/#{application}"

set :use_sudo, false

set :group_writable, false

default_run_options[:pty] = true 



role :app, server_name

role :web, server_name

role :db,  server_name, :primary => true



# set the proper permission of the public folder

task :after_update_code, :roles => [:web, :db, :app] do

  run "chmod 755 #{release_path}/public"

end



namespace :deploy do



  desc "restart passenger"

  task :restart do

    passenger::restart

  end

   

end



namespace :passenger do

  desc "Restart dispatchers"

  task :restart do

    run "touch #{current_path}/tmp/restart.txt"

  end

end



###### END DEPLOY.RB ######
