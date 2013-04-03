#
# Cookbook Name:: server.1mg.org
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user 'uehata' do
  action :create
  uid 1000
  gid 100
  home '/home/uehata'
  shell '/bin/bash'
end

directory '/home/uehata/.ssh' do
  action :create
  owner 'uehata'
  group 'users'
  mode '0700'
  recursive true
end

cookbook_file '/home/uehata/.ssh/authorized_keys' do
  source "uehata.pub.key"
  owner 'uehata'
  group 'users'
  mode '0400'
end

user 'root' do
  action :modify
  password '$6$gVYWrVzD$hgXuNvY8DDzXJZCD3/r1eGaAbjtJ3fqbNlqrR9nAhIugI7n5TH5sOGKqaJl0.1IOmr24hrh.O4TlzECLQoN9a1'
end

execute 'add_hostname' do
  action :run
  command "echo 'HOSTNAME=#{node.fqdn}' >> /etc/sysconfig/network"
  not_if "egrep '^HOSTNAME=#{node.fqdn}' /etc/sysconfig/network"
end

execute 'set_root' do
  action :run
  command "echo 'root: #{node.email.root}' >> /etc/aliases"
  not_if "egrep '^root:' /etc/aliases"
  notifies :run, 'execute[newaliases]'
end

execute 'newaliases' do
  action :nothing
  command 'newaliases'
end