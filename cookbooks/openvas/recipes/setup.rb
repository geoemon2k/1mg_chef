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
  only_if FileTest.file("/usr/bin/openvas-cli")
end
