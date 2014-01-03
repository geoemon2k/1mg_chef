#
# Cookbook Name:: php
# Recipe:: setup
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
      notifies :restart, 'service[' + node['php']['service'] + ']'
    end
  end
end