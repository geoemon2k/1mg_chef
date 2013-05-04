#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'nginx' do
  action :install
  if node['nginx']['options']
    options node['nginx']['options']
  end
end

template node['nginx']['dir']+"nginx.conf" do
  source "nginx.conf.erb"
  owner node['nginx']['user']
  group node['nginx']['group']
  mode  0644
  notifies :reload, 'service[nginx]'
end

directory node['nginx']['dir']+"conf.d/" do
  action :create
  owner node['nginx']['user']
  group node['nginx']['group']
  mode  0755
end

template node['nginx']['dir']+node['nginx']['include_dir']+"server.1mg.org.conf" do
  source "server.1mg.org.conf.erb"
  owner node['nginx']['user']
  group node['nginx']['group']
  mode  0644
  notifies :reload, 'service[nginx]'
end

template node['nginx']['dir']+node['nginx']['include_dir']+"www.1mg.org.conf" do
  source "server.1mg.org.conf.erb"
  owner node['nginx']['user']
  group node['nginx']['group']
  mode  0644
  notifies :reload, 'service[nginx]'
end

service 'nginx' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
