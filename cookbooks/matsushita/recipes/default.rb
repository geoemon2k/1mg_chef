#
# Cookbook Name:: matsushita
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user node['matsushita']['owner'] do
  action :create
  uid 998
  gid node['matsushita']['group']
  home node['matsushita']['docroot']
  shell '/bin/bash'
  password '$1$9z8oaotA$uBALbMLxOYIfFBerAztjm0'
  supports :manage_home => true, :non_unique => false
end

directory node['matsushita']['dataroot'] do
  owner node['matsushita']['owner']
  group node['matsushita']['group']
  mode "0755"
  action :create
end

link node['matsushita']['docroot'] do
  to node['matsushita']['dataroot']
end
