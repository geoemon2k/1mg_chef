#
# Cookbook Name:: opendkim
# Recipe:: setup
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'opendkim' do
  action :install
  options "--enablerepo=epel"
end

service 'opendkim' do
  supports :status => true, :restart => true, :reload => true
  action [ :start, :enable ]
end
