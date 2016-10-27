#
# Cookbook Name:: nsd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if (node['platform'] == 'centos' && node['platform_version'].to_i < 7) || 
  (node['platform'] == 'ubuntu' && node['platform_version'].to_i < 14)
  package node['nsd']['pkg_name'] do
    action :install
    if node['nsd']['pkg_options']
      options node['nsd']['pkg_options']
    end
  end
else
  ['gcc', 'bison', 'flex', 'byacc', 'openssl-devel'].each do |package_name|
    package "#{package_name}"  do
      action :install
    end
  end

  bash 'install nsd' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    wget http://www.nlnetlabs.nl/downloads/nsd/nsd-3.2.19.tar.gz
    tar zxf nsd-3.2.19
    cd nsd-3.2.19
    ./configure && make && make install
    EOH
    not_if do File.file?('/usr/local/sbin/nsd') end
  end

  group 'nsd' do
    action :create
    gid 1000
  end
  
  user 'nsd' do
    action :create
    comment 'NSD Daemon User'
    uid 1000
    gid 'nsd'
    home '/etc/nsd'
    shell '/sbin/nologin'
  end
  
  cookbook_file '/usr/lib/systemd/system/nsd.service' do
     source 'nsd.service'
     owner 'root'
     group 'root'
     mode '0644'
   end
end

include_recipe 'nsd::setup_zone'

template node['nsd']['etc'] + "/nsd.conf" do
  source 'nsd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[' + node['nsd']['service'] + ']'
end

service node['nsd']['service'] do
  action :nothing
  supports :reload => true, :status => true, :restart => true, :rebuild => true
end
