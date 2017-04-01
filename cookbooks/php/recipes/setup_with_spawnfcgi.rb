#
# Cookbook Name:: php
# Recipe:: setup_spawnfcgi
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node['php']['packages'] != nil
  node['php']['packages'].each do |pkg|
    package pkg['pkg_name'] do
      action :install
      if pkg['pkg_option'] != nil
        options pkg['pkg_option']
      end
    end
  end
end

package node['php']['spawnfcgi']['pkg_name'] do
  action :install
  if node['php']['spawnfcgi']['pkg_options'] != nil
    options node['php']['spawnfcgi']['pkg_options']
  end
end

case node['platform']
when 'centos'
  template node['base']['sysconfig'] + '/spawn-fcgi' do
    source 'sysconfig_spawn-fcgi.erb'
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, 'service[' + node['php']['spawnfcgi']['service'] + ']'
  end

  execute 'chown-libdirectory' do
    command "chown -R " + node['php']['spawnfcgi']['owner'] + ':' + node['php']['spawnfcgi']['group'] + " /var/lib/php"
    only_if do File.directory?("/var/lib/php") end
  end
when 'ubuntu'
  template node['base']['init.d'] + '/spawn-fcgi' do
    source 'spawn-fcgi.init.erb'
    owner 'root'
    group 'root'
    mode 0755
  end

  template '/etc/php5/mods-available/apcu.ini' do
    source 'apcu.ini.erb'
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, 'service[' + node['php']['spawnfcgi']['service'] + ']'
  end
end

service node['php']['spawnfcgi']['service'] do
  action :nothing
end
