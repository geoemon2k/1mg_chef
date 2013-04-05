#
# Cookbook Name:: server.1mg.org
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory '/root/.ssh' do
  action :create
  owner 'root'
  group 'root'
  mode '0700'
  recursive true
end

cookbook_file '/root/.ssh/authorized_keys' do
  source "pub.key"
  owner 'root'
  group 'root'
  mode '0400'
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

cookbook_file '/var/chef/.git/hooks/post-merge' do
  source 'post-merge'
  owner 'root'
  group 'root'
  mode 0755
end