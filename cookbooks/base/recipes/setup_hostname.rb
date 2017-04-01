#
# Cookbook Name:: base
# Recipe:: setup_hostname
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute 'set_hostname' do
  action :run
  command "hostname " + node['base']['hostname']
end

case node[:platform]
when 'centos', 'fedora'
  execute 'add_hostname' do
    action :run
    command "echo 'HOSTNAME=" + node['base']['hostname'] + "' >> " + node['base']['sysconfig'] + "/network"
    not_if "egrep '^HOSTNAME=" + node['base']['hostname'] + "' " + node['base']['sysconfig'] + "/network"
  end
end

template '/etc/hostname' do
  source 'hostname.erb'
  owner 'root'
  group 'root'
  mode 0644
end

template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  mode 0644
end
