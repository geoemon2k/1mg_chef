#
# Cookbook Name:: base
# Recipe:: stop_service
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node['base']['on_services']

  node['base']['off_services'].each do |service_name|
    service service_name do
      action [:disable, :stop]
    end
  end


  node['base']['on_services'].each do |service_name|
    service service_name do
      action [:enable, :start]
    end
  end

end
