#
# Cookbook Name:: base
# Recipe:: setup_root_user
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file '/root/.ssh/authorized_keys' do
  source "pub.key"
  owner 'root'
  group 'root'
  mode '0400'
end
