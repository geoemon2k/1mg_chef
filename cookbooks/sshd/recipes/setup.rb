#
# Cookbook Name:: sshd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['sshd']['pkg_name'] do
  action :install
end

template node['sshd']['sshd_config'] do
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode "0600"
  notifies :restart, 'service[' + node['sshd']['service'] + ']'
end

group 'sftponly' do
  action :create
  gid 1001
end

node["sshd"]["sftp_users"].each do |sftp_users|
  user sftp_users["user"] do
    uid sftp_users["uid"]
    action :create
    gid "sftponly"
    shell '/bin/zsh'
    home "/home/#{sftp_users['user']}" 
    supports :manage_home => true
  end
end
