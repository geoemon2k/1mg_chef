#
# Cookbook Name:: ruby
# Recipe:: setup_ruby_on_rvm
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "setup_ruby" do
  command "rvm install " + node['ruby']['version']
  not_if "rvm list|egrep " + node['ruby']['version']
  action :run
end
