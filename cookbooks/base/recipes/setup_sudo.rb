#
# Cookbook Name:: base
# Recipe:: setup_sudo
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/sudoers" do
  source "sudoers.erb"
  owner "root"
  group "root"
  mode "0644"
end
