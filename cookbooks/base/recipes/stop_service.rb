#
# Cookbook Name:: base
# Recipe:: stop_service
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node['base']['off_services']
  node['base']['off_services'].each do |name|
    service 'disable_service_' + name do
      service_name name
      action :disable
    end
  end
end


if node['base']['on_services']
  node['base']['on_services'].each do |name|
    service 'enable_service_' + name do
      service_name name
      action :enable
    end
  end

end
