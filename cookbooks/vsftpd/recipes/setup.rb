#
# Cookbook Name:: vsftpd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['vsftpd']['pkg_name'] do
  action :install
  if node['vsftpd']['pkg_options']
    options node['vsftpd']['pkg_options']
  end
end

template node['vsftpd']['etc'] + "/vsftpd.conf" do
  source "vsftpd.conf.erb"
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :reload, 'service[' + node['vsftpd']['service'] + ']'
end

service node['vsftpd']['service'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end
