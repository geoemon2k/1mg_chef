curl -L https://www.opscode.com/chef/install.sh | bash
apt-get install git
git clone git@github.com:geoemon2k/1mg_chef.git /var/chef
chef-solo -c /var/chef/solo.rb -o 'role[1mg_ubuntu14]'
