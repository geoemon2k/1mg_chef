#
# Cookbook Name:: pcre
# Recipe:: module_APC
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "install_pcre_#{module}" do
  action :run
  command "pcre install #{module}"
  not_if "pcre info ${module}"
  notifies :run, 'execute[fixed_php_ini_apc]'
end

execute 'fixed_php_ini_apc' do
  action :nothing
  command "echo 'extention=apc.so' >> #{node.path.phpini}"
  not_if "egrep '^extention=apc.so' #{node.path.phpini}"
end
  
