#
# Cookbook Name:: nsd
# Recipe:: setup_zone
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template node['nsd']['etc'] + "/zones.conf" do
  source 'zones.conf.erb'
  owner "root"
  group "root"
  mode '0644'
  variables({
    :zones => node['nsd']['zones']
  })
  notifies :restart, 'service[' + node['nsd']['service'] + ']'
end

directory node['nsd']['zones_dir'] do
  action :create
  owner "root"
  group "root"
  mode '0755'
end

if node['nsd']['zones'] != nil
  node['nsd']['zones'].each do |zone_info|
    cookbook_file node['nsd']['zones_dir'] + "/" + zone_info['zone_name'] + ".zone" do
      source "zones/" + zone_info['zone_name'] + ".zone"
      owner "root"
      group "root"
      mode '0644'
      notifies :restart, 'service[' + node['nsd']['service'] + ']'
    end
  end
end

