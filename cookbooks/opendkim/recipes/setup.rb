#
# Cookbook Name:: opendkim
# Recipe:: setup
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['opendkim']['pkg_name'] do
  action :install
  options node['opendkim']['options']
end

directory "#{node['opendkim']['keys_dir']}" do
  owner 'root'
  group node['opendkim']['group']
  mode '0755'
  action :create
end

cookbook_file "#{node['opendkim']['keys_dir']}/dkimselecter.txt" do
  source 'dkimselecter.txt'
  owner node['opendkim']['user']
  group node['opendkim']['group']
  mode '0644'
end

file "#{node['opendkim']['keys_dir']}/dkimselecter.private" do
  content IO.read( "#{node['base']['1mg_dir']}/chef/files/dkimselecter.private" )
  owner node['opendkim']['user']
  group node['opendkim']['group']
  mode '0644'
end

service node['opendkim']['service'] do
  supports :status => true, :restart => true, :reload => true
  action [ :start, :enable ]
end
