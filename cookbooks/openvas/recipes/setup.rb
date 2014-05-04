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

service openvas do
  action [:enable, :start]
end
