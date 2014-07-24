#
# Cookbook Name:: openvas
# Recipe:: setup
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "openvas"  do
  action :install
  options "--enablerepo=atomic"
end

execute "setup openvas" do
  action :run
  command "echo 'y'|openvas-setup"
  not_if FileTest.directory("/var/lib/openvas/plugins/")
end

service "openvas-scanner" do
  action [:enable, :start]
end

service "openvas-manager" do
  action [:enable, :start]
end

service "openvas-manager" do
  action :stop, immidiately
end
