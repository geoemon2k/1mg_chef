#
# Cookbook Name:: sendmail
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'sendmail' do
  action :install
end

include_recipe "sendmail::stop_postfix"

service 'sendmail' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
