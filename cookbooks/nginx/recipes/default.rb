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
  if node['nginx']['repo_source'] != nil
    options "--enablerepo=#{node.nginx.repo_source}"
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

node.nginx.conf_lists.each do |filename|
  if #{filename} != '' do
    cookbook_file node['nginx']['dir']+node['nginx']['include_dir']+"#{filename}" do
      source "#{filename}"
      owner node['nginx']['user']
      group node['nginx']['group']
      mode  0644
      notifies :reload, 'service[nginx]'
    end
  end
end

service 'nginx' do
  action [:enable, :start]
  supports :status => true, :restart => true, :reload => true
end
