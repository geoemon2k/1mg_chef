#
# Cookbook Name:: php
# Recipe:: php_mysql
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['php_mysql']['package'] do
  action :install
  if node['php_mysql']['repo_source']
    options "--enablerepo=#{node.php_mysql.repo_source}"
  end
end
