ln -sf /opt/chef/embedded/bin/* /usr/local/bin/
yum install -y git gcc
gem install cucumber rspec
ln -sf /opt/chef/embedded/bin/* /usr/local/bin/
mkdir -p /var/chef/cookbooks /tmp/chef-cache /var/chef/backups /etc/chef
echo 'file_cache_path "/tmp/chef-cache"' >> /etc/chef/solo.rb
echo 'cookbook_path "/var/chef/cookbooks"' >> /etc/chef/solo.rb
echo 'file_backup_path "/var/chef/backups"' >> /etc/chef/solo.rb
hostname server.1mg.org
chef-solo -j /var/chef/cookbooks/1mg.json
