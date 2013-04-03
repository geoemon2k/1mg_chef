#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node.php.packages.each_pair do |package, options|
  package "#{package}" do
    action :install
    if "#{options}" != ''
      options "#{options}"
    end
  end
end

execute 'chown-libdirectory' do
  command "chown -R #{node.spawnfcgi.owner}:#{node.spawnfcgi.group} /var/lib/php"
  only_if "ls -al /var/lib/php"
end