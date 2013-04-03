#
# Cookbook Name:: pecl
# Recipe:: module_APC
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "install_APC" do
  action :run
  command "pecl install APC"
  not_if "pecl info APC"
  notifies :run, 'execute[fixed_php_ini_apc]'
end

execute 'fixed_php_ini_apc' do
  action :nothing
  command "echo 'extention=apc.so' >> #{node.path.phpini}"
  not_if "egrep '^extention=apc.so' #{node.path.phpini}"
  notifies :restart, 'service[spawn-fcgi]'
end

