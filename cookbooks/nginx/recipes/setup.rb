#
# Cookbook Name:: nginx
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['nginx']['pkg_name'] do
  action :install
  if node['nginx']['pkg_options']
    options node['nginx']['pkg_options']
  end
end

include_recipe 'phpfpm::default'

cookbook_file node['nginx']['include_dir'] + '/default.conf' do
   action :delete
end

cookbook_file node['nginx']['include_dir'] + '/virtual.conf' do
   action :delete
end

cookbook_file node['nginx']['include_dir'] + '/ssl.conf' do
   action :delete
end

template node['nginx']['etc'] + "/nginx.conf" do
  source "nginx.conf.erb"
  owner node['nginx']['user']
  group node['nginx']['group']
  mode  0644
  notifies :reload, 'service[' + node['nginx']['service'] + ']'
end

if node['nginx']['conf_lists'] != nil
  node['nginx']['conf_lists'].each do |conf_name|
    template node['nginx']['include_dir'] + '/' + conf_name + ".conf" do
      source conf_name + ".conf.erb"
      owner "root"
      group "root"
      mode  0644
      notifies :reload, 'service[' + node['nginx']['service'] + ']'
    end
  end
end

# for fluentd
directory '/var/log/nginx' do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0705'
  action :create
end

service node['nginx']['service'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end