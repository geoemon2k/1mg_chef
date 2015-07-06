#
# Cookbook Name:: iptables
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "iptables" do
  action :install
end

template node['iptables']['etc'] + '/iptables' do
  source 'iptables.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :iptables => node['iptables']
  })
  notifies :restart, 'service[iptables]'
end

service 'iptables' do
  action [:enable, :start]
end
  
