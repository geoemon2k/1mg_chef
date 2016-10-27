#
# Cookbook Name:: mysql
# Recipe:: setup_server
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node['platform'] == 'centos' && node['platform_version'].to_i >= 7
  bash 'install mysql-community-repo' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      rpm -ivh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
    EOH
  end
end

package node['mysqld']['package'] do
  action :install
  if node['mysqld']['install_option']
    options node['mysqld']['install_option']
  end
end

template node['base']['etc'] + '/my.cnf' do
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[' + node['mysqld']['service'] + ']'
end

directory node['mysqld']['conf_lists']['mysqld']['datadir'] do
  owner node['mysqld']['owner']
  group node['mysqld']['group']
  mode "0755"
  action :create
end

service node['mysqld']['service'] do
  action :nothing
  supports :status => true, :restart => true
end
