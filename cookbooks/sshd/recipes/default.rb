#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "centos"
  pkg_name = 'openssh-server'
  service_name = 'sshd'
when "ubuntu"
  pkg_name = 'openssh-server'
  service_name = 'ssh'
end

package "#{pkg_name}" do
  action :install
end

if node.sshd.conf_lists
  node.sshd.conf_lists.each_pair do |name, value|
    execute "replace_set_sshd_config_#{name}" do
      command "sed -i -e \"s/^#{name} \.*/#{name} #{value}/g\" /etc/ssh/sshd_config"
      not_if "egrep '^#{name} #{value}' /etc/ssh/sshd_config"
      notifies :restart, 'service[sshd]'
    end
    execute "add_sshd_config_#{name}" do
      command "echo '#{name} #{value}' >> /etc/ssh/sshd_config"
      not_if "egrep '^#{name} #{value}' /etc/ssh/sshd_config"
      notifies :restart, 'service[sshd]'
    end
  end
end


service "#{service_name}" do
  action [:enable, :start]
end
