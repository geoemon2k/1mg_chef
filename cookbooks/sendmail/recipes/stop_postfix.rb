#
# Cookbook Name:: sendmail
# Recipe:: stop_postfix
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
service 'stop_postfix_for_sendmail' do
  service_name 'postfix'
  action [:disable, :stop]
  only_if "chkconfig postfix"
end
