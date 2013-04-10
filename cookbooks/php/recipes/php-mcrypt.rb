#
# Cookbook Name:: php
# Recipe:: php_mcrypt
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['php_mcrypt']['package'] do
  action :install
  if node['php_mcrypt']['repo_source']
    options '--enablerepo='+node['php_mcrypt']['repo_source']
end

