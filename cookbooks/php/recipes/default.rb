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
  if node['php']['install_option']
    options node['php']['install_option']
  end
end
