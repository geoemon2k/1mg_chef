#
# Cookbook Name:: nginx
# Recipe:: install
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['nginx']['pkg_name'] do
  action :install
  if node['nginx']['pkg_options']
    options node['nginx']['pkg_options']
  end
end

group 'nginx' do
  action :create
  gid 80
end


user 'nginx' do
  action :create
  comment 'Nginx User'
  uid 80
  gid 'nginx'
  home '/home/random'
  shell '/sbin/nologin'
  supports :manage_home => false
end
