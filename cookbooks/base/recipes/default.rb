#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template '/usr/local/1mg/bin/backup.sh' do
  source 'backup.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

cron 'backup' do
  hour '0'
  minute '0'
  command 'sh /usr/local/1mg/bin/backup.sh'
end
