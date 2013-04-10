#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['php']['package'] do
  action :install
  if node['php']['repo_source']
    options '--enablerepo='+node['php']['repo_source']
end

