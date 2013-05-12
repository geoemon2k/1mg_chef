#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['ntp']['package_name'] do
  action :install
end

service node['ntp']['service_name'] do
  action [:enable,:start]
  supports :status => true, :restart => true
end

template node['ntp']['etc']+"ntp.conf" do
  source "ntp.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[#{node['ntp']['service_name']}]"
end