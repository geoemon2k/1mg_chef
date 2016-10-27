#
# Cookbook Name:: matsusita.com
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user node['matsusita']['owner'] do
  action :create
  uid 998
  gid node['matsusita']['group']
  home node['matsusita']['docroot']
  shell '/bin/bash'
  password '$1$9z8oaotA$uBALbMLxOYIfFBerAztjm0'
end

directory node['matsusita']['dataroot'] do
  owner node['matsusita']['owner']
  group node['matsusita']['group']
  mode "0755"
  action :create
end

link node['matsusita']['docroot'] do
  to node['matsusita']['dataroot']
end
