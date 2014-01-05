#
# Cookbook Name:: ruby
# Recipe:: setup_ruby_on_rvm
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "setup_ruby" do
  command "/usr/local/rvm/bin/rvm install " + node['ruby']['version']
  not_if "/usr/local/rvm/bin/rvm list|egrep 'ruby-" + node['ruby']['version'] + "'"
  action :run
end

execute "use_ruby" do
  command "/usr/local/rvm/bin/rvm use " + node['ruby']['version']
  action :run
  not_if "/usr/local/rvm/bin/rvm list|grep '=>'|egrep 'ruby-" + node['ruby']['version'] + "'"
end
