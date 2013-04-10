#
# Cookbook Name:: spawn-fcgi
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'spawn-fcgi' do
  action :install
  options '--enablerepo=epel'
end

template '/etc/sysconfig/spawn-fcgi' do
  source 'sysconfig.spawn-fcgi.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[spawn-fcgi]'
end

execute 'chown-libdirectory' do
  command "chown -R #{node.spawnfcgi.owner}:#{node.spawnfcgi.group} /var/lib/php"
  only_if "ls /var/lib/php"
end

service 'spawn-fcgi' do
  action [:enable, :start]
end
