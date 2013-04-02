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

service 'spawn-fcgi' do
  action [:enable, :start]
end
  