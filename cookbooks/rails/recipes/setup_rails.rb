#
# Cookbook Name:: rails
# Recipe:: setup
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
gem_package "rails" do
  action :install
  gem_binary "/opt/chef/embedded/bin/gem"
end
