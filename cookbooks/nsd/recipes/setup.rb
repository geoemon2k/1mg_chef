#
# Cookbook Name:: nsd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['nsd']['pkg_name'] do
  action :install
  if node['nsd']['pkg_options']
    options node['nsd']['pkg_options']
  end
end

template node['nsd']['etc'] + "/nsd.conf" do
  source 'nsd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[' + node['nsd']['service'] + ']'
end

service node['nsd']['service'] do
  action [:enable, :start]
  supports :reload => true, :status => true, :restart => true, :rebuild => true
end
