#
# Cookbook Name:: mariadb
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['mariadbd']['package'] do
  action :install
  if node['mariadbd']['install_option']
    options node['mariadbd']['install_option']
  end
end

template node['base']['etc'] + '/my.cnf' do
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[' + node['mariadbd']['service'] + ']'
end

directory node['mariadbd']['conf_lists']['mariadb']['datadir'] do
  owner node['mariadbd']['owner']
  group node['mariadbd']['group']
  mode "0755"
  action :create
end

service node['mariadbd']['service'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end
