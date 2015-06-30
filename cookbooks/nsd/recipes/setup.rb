#
# Cookbook Name:: nsd
# Recipe:: setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node['platform'] == 'centos' && node['platform_version'].to_i < 7
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
    wget http://www.nlnetlabs.nl/downloads/nsd/nsd-4.1.3.tar.gz
    tar zxf nsd-4.1.3
    cd nsd-4.1.3
    ./configure --with-libevent=no && make && make install
    EOH
    not_if do File.exists('/usr/local/sbin/nsd') end
  end

  cookbook_file '/usr/lib/systemd/system/nsd.service' do
     source 'nsd.service'
     owner 'root'
     group 'root'
     mode '0644'
   end
end

template node['nsd']['etc'] + "/nsd.conf" do
  source 'nsd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[' + node['nsd']['service'] + ']'
end

service node['nsd']['service'] do
  action [:enable, :start]
  supports :reload => true, :status => true, :restart => true, :rebuild => true
end
