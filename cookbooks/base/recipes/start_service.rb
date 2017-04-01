#
# Cookbook Name:: base
# Recipe:: start_service
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node['base']['on_services']
  node['base']['on_services'].each do |name|
    service 'enable_service_' + name do
      service_name name
      action [:enable, :start]
    end
  end
end
