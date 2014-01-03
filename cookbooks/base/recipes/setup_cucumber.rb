#
# Cookbook Name:: base
# Recipe:: setup_cucumber
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "libxml2-devel" do
  action :install
end

package "libxslt-devel" do
  action :install
end

gem_package "cucumber" do
  action :install
  gem_binary "/opt/chef/embedded/bin/gem"
end

gem_package "rspec" do
  action :install
  gem_binary "/opt/chef/embedded/bin/gem"
end
