#
# Cookbook Name:: sshd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
service node['sshd']['service'] do
  action :nothing
  supports :status => true, :restart => true
end

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

if node['sshd']['sftp_users'].nil? == false && node['sshd']['sftp_users'].empty? == false
  node["sshd"]["sftp_users"].each do |sftp_users|
    link "/home/#{sftp_users['user']}" do
      to "/usr/local/1mg/data/#{sftp_users['user']}"
    end

    user sftp_users["user"] do
      uid sftp_users["uid"]
      action :create
      gid "sftponly"
      shell '/bin/zsh'
      home "/home/#{sftp_users['user']}"
    end

    directory "/home/#{sftp_users['user']}/.ssh/" do
      owner sftp_users['user']
      group 'sftponly'
      mode '0755'
      action :create
    end
    
    template "/home/#{sftp_users['user']}/.ssh/authorized_keys" do
      source 'authorized_keys.erb'
      owner sftp_users['user']
      group 'sftponly'
      mode '0400'
      variables({
        :authkey => sftp_users['authkey']
      })
    end
  end
end
