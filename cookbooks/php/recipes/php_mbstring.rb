#
# Cookbook Name:: php
# Recipe:: php_mbstring
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['php_mbstring']['package'] do
  action :install
  if node['php_mbstring']['repo_source']
    options "--enablerepo=#{node.php_mbstring.repo_source}"
  end
end

