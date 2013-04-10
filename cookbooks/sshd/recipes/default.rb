#
# Cookbook Name:: sshd
# Recipe:: node
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['sshd']['package'] do
  action :install
end

if node['sshd']['conf_lists']
  node['sshd']['conf_lists'].each_pair do |name, value|
    execute "replace_set_sshd_config_#{name}" do
      command "sed -i -e \"s/^#{name} \.*/#{name} #{value}/g\" #{node['sshd']['dir']}sshd_config"
      not_if "egrep '^#{name} #{value}' #{node['sshd']['dir']}sshd_config"
      notifies :restart, "service[#{node['sshd']['service_name']}]"
    end
    execute "add_sshd_config_#{name}" do
      command "echo '#{name} #{value}' >> #{node['sshd']['dir']}sshd_config"
      not_if "egrep '^#{name} #{value}' #{node['sshd']['dir']}sshd_config"
      notifies :restart, "service[#{node['sshd']['service_name']}]"
    end
  end
end

service node['sshd']['service_name'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end
