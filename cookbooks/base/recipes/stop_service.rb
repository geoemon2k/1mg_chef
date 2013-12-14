#
# Cookbook Name:: base
# Recipe:: stop_service
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node['base']['on_services']

  node['base']['off_services'].each do |name|
    service 'disable_service' do
      service_name name
      action [:disable, :stop]
    end
  end


  node['base']['on_services'].each do |name|
    service 'enable_service' do
      service_name name
      action [:enable, :start]
    end
  end

end
