1mg_chef
========
yum install git gcc
curl -L https://www.opscode.com/chef/install.sh | bash
ln -sf /opt/chef/embedded/bin/* /usr/local/bin/
gem install cucumber rspec
ln -sf /opt/chef/embedded/bin/* /usr/local/bin/
hostname server.1mg.org
chef-solo -j /var/chef/cookbooks/1mg.json
