#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['sshd']['package'] do
  action :install
end

if node.sshd.conf_lists
  node.sshd.conf_lists.each_pair do |name, value|
    execute "replace_set_sshd_config_#{name}" do
      command "sed -i -e \"s/^#{name} \.*/#{name} #{value}/g\" #{default['sshd']['dir']}sshd_config"
      not_if "egrep '^#{name} #{value}' #{default['sshd']['dir']}sshd_config"
      notifies :restart, "service[#{default['sshd']['service_name']}]"
    end
    execute "add_sshd_config_#{name}" do
      command "echo '#{name} #{value}' >> #{default['sshd']['dir']}sshd_config"
      not_if "egrep '^#{name} #{value}' #{default['sshd']['dir']}sshd_config"
      notifies :restart, "service[#{default['sshd']['service_name']}]"
    end
  end
end

service default['sshd']['service_name'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end
