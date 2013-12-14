#
# Cookbook Name:: spawn-fcgi
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['spawnfcgi']['pkg_name'] do
  action :install
  if node['spawnfcgi']['pkg_options'] != nil
    options node['spawnfcgi']['pkg_options']
  end
end

template node['base']['sysconfig'] + '/spawn-fcgi' do
  source 'sysconfig.spawn-fcgi.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[' + node['spawnfcgi']['service'] + ']'
end

execute 'chown-libdirectory' do
  command "chown -R " + node['spawnfcgi']['owner'] + ':' + node['spawnfcgi']['group'] + " /var/lib/php"
  only_if "ls /var/lib/php"
end

service node['spawnfcgi']['service'] do
  action [:enable, :start]
end
