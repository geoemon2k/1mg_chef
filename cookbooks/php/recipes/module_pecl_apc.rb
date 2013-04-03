#
# Cookbook Name:: php
# Recipe:: module_pecl_apc
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "php-pecl-apc" do
  action :run
  notifies :restart, 'service[spawn-fcgi]'
end
