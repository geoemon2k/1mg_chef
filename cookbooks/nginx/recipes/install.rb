#
# Cookbook Name:: nginx
# Recipe:: install
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['nginx']['pkg_name'] do
  action :install
  if node['nginx']['pkg_options']
    options node['nginx']['pkg_options']
  end
end
