#
# Cookbook Name:: fluentd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/yum.repos.d/td.repo" do
  source "td.repo.erb"
  owner "root"
  group "root"
  mode  0644
end
  
node['fluentd']['packages'].each do |pkg|
  package pkg['name'] do
    action :install
    if pkg['options']
      options pkg['options']
    end
  end
end

template node['fluentd']['etc'] + "/td-agent.conf" do
  source "td-agent.conf.erb"
  owner node['fluentd']['user']
  group node['fluentd']['group']
  mode  0644
  notifies :restart, 'service[' + node['fluentd']['service'] + ']'
end

service node['fluentd']['service'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end"