#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package node['php']['package'] do
  action :install
  if node['php']['install_option']
    options node['php']['install_option']
  end
  notifies :restart, 'service[spawn-fcgi]'
end

if node['php']['sub_packages'] != nil
  node['php']['sub_packages'].each do |pkg|
    pkg_name = pkg_option = nil
    pkg.each_pair do |key, value|
      if key == 'pkg_name'
        pkg_name = value
      elsif key == 'option'
        pkg_option = value
      end

      package pkg_name do
        action :install
        if pkg_option != nil
          option pkg_option
        end
        notifies :restart, 'service[spawn-fcgi]'
      end
    end
  end
end
      
        
