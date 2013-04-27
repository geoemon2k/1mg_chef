#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node['php']['packages'].each_pair do |package_name, install_options|
  package package_name do
    action :install
    if install_options != ''
      options install_options
    end
  end
end

execute 'chown-libdirectory' do
  command "chown -R "+node['spawnfcgi']['owner']+":"+node['spawnfcgi']['group']+" /var/lib/php"
  only_if "ls -al /var/lib/php"
end
