rpoll
=====
Usage: 
git clone https://github.com/yuri-g/rpoll.git
cd rpoll
bundle install
Install jsruntime if needed
change permissions in db/, tmp/, log/ folders (had to do it on ubuntu)
sudo chown -R user_name db/
Load schema:
rake db:schema:load RAILS_ENV=production
Precompile assets:
