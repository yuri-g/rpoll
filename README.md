##rpoll

###Usage: 

`git clone https://github.com/yuri-g/rpoll.git`

`cd rpoll`

`bundle install`

Install jsruntime if needed

change permissions in db/, tmp/, log/ folders (had to do it on ubuntu)

`sudo chown -R user_name db/`

Load schema:

`rake db:schema:load RAILS_ENV=production`

Precompile assets:

`RAILS_ENV=production rake assets:precompile`

Start app:

`rails s -e production -p 80`

###Testing:

`spring rspec` or just `rspec`

Coverage report will be created in the `coverage` folder.
