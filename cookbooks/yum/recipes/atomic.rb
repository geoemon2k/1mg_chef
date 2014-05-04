#
# Cookbook Name:: yum
# Recipe:: atomic
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cpu = String.new
case node['kernel']['machine']
when 'i686'
  cpu = 'i386'
when 'x86_64'
  cpu = 'x86_64'
end
execute "install_atomic_repo" do
  action :run
  command "rpm -ivh http://www6.atomicorp.com/channels/atomic/centos/#{node['platform_version'].to_i}/#{cpu}/RPMS/#{node['yum']['atomic']['rpm']}"
  not_if "ls /etc/yum.repos.d/atomic.repo"
end

if node['yum']['atomic']['disabled']
  execute "disable_atomic_repo" do
    action :run
    command "sed -i -e 's/enabled=1/enabled=0/g' /etc/yum.repos.d/atomic.repo"
    only_if 'grep "enabled=1" /etc/yum.repos.d/atomic.repo'
  end
else
  execute "enable_atomic_repo" do
    action :run
    command "sed -i -e 's/enabled=0/enabled=1/g' /etc/yum.repos.d/atomic.repo"
    only_if 'grep "enabled=0" /etc/yum.repos.d/atomic.repo'
  end
end

