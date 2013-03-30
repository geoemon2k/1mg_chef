#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'openssh-server' do
  action :install
end

node.options.list.each_pair do |name, value|
  execute "set_sshd_config_#{name}" do
    command "sed -i -e \"s/^#{name} \.*/#{name} #{value}/g\" /etc/ssh/sshd_config"
    not_if "egrep '^#{name} #{value}' /etc/ssh/sshd_config"
    notifies :restart, 'service[sshd]'
  end 
end

service 'sshd' do
  action [:enable, :start]
end
