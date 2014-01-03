#
# Cookbook Name:: yum
# Recipe:: epel
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "install_epel_gpg-key" do
  action :run
  command "rpm --import http://ftp.iij.ad.jp/pub/linux/fedora/epel/"+node['yum']['epel']['gpg_keyname']
  not_if "ls /etc/pki/rpm-gpg/" + node['yum']['epel']['gpg_keyname']
end

execute "install_epel_repo" do
  action :run
  command "rpm --install " + node['yum']['epel']['url']
  not_if 'rpm -q epel-release'
end

if node['yum']['epel']['disabled']
  execute "disable_epel_repo" do
    action :run
    command "sed -i -e 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo"
    only_if 'grep "enabled=1" /etc/yum.repos.d/epel.repo'
  end
else
  execute "enable_epel_repo" do
    action :run
    command "sed -i -e 's/enabled=0/enabled=1/g' /etc/yum.repos.d/epel.repo"
    only_if 'grep "enabled=0" /etc/yum.repos.d/epel.repo'
  end
end

