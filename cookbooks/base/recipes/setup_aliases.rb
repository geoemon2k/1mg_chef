#
# Cookbook Name:: base
# Recipe:: setup_aliases
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute 'set_root' do
  action :run
  command "echo 'root: " + node['base']['root_address'] + "' >> " + node['base']['etc'] + "aliases"
  not_if "egrep '^root: " + node['base']['root_address'] + "' " + node['base']['etc'] + "/aliases"
  notifies :run, 'execute[newaliases]'
end

execute 'newaliases' do
  action :nothing
  command 'newaliases'
end
