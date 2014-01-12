#
# Cookbook Name:: ruby
# Recipe:: setup_rails_on_rvm
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'sqlite-devel' do
  action :install
end

execute "create_gemset_rails" do
  command "/usr/local/rvm/bin/rvm gemset create rails-" + node['ruby']['rails_version']
  action :run
  not_if "/usr/local/rvm/bin/rvm gemset list|grep 'rails-" + node['ruby']['rails_version'] + "'"
end

execute "change_gemset_rails" do
  command "/usr/local/rvm/bin/rvm " + node['ruby']['version'] + '@rails-' + node['ruby']['rails_version']
  action :run
  not_if "/usr/local/rvm/bin/rvm gemset list|grep =>|grep 'rails-" + node['ruby']['rails_version'] + "'" 
end

gem_package "rails" do
  version node['ruby']['rails_version']
  action :install
end

gem_package "execjs" do
  action :install
end

gem_package "therubyracer" do
  action :install
end
