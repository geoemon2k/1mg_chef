#
# Cookbook Name:: sshd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['sshd']['pkg_name'] do
  action :install
end

template node['sshd']['sshd_config'] do
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode "0600"
end

service node['sshd']['service'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end
