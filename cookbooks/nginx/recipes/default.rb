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
  options '--enablerepo=epel'
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

node.conf.list.each do |filename|
  if #{filename} != '' do
    cookbook_file "/etc/nginx/conf.d/#{filename}" do
      source "#{filename}"
      owner 'nginx'
      group 'nginx'
      mode  0644
      notifies :restart, 'service[nginx]'
    end
  end
end

service 'nginx' do
  action [:enable, :start]
end

