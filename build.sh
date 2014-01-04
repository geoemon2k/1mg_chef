# git install
yum install -y git sudo

#setup sudo
echo 'jenkins ALL=(ALL)       NOPASSWD: /usr/bin/chef-solo' >> /etc/sudoers
sed -i -e '/requiretty/d' /etc/sudoers

# git clone
mv /var/chef /var/chef.org
git clone https://github.com/geoemon2k/1mg_chef.git /var/chef

# chef install
curl -L https://www.opscode.com/chef/install.sh | bash

#gem install cucumber rspec
#mkdir -p /var/chef/cookbooks /tmp/chef-cache /var/chef/backups /etc/chef
#hostname server.1mg.org
chef-solo -c /var/chef/solo.rb -o 'role[1mg]'
