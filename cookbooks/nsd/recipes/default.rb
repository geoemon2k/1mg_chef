package node['nsd']['pkg_name'] do
  action :install
  if node['nsd']['pkg_options']
    options node['nsd']['pkg_options']
  end
end

template node['nsd']['etc'] + "/nsd.conf" do
  source 'nsd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[' + node['nsd']['service'] + ']'
end

template node['nsd']['etc'] + "/other.conf" do
  source 'other.conf.erb'
  owner node['nsd']['user']
  group node['nsd']['group']
  mode '0644'
  variables({
    :zone_lists => node['nsd']['zone_lists']
  })
  notifies :restart, 'service[' + node['nsd']['service'] + ']'
end

directory node['nsd']['etc'] + '/' + node['nsd']['zones_dir'] do
  action :create
  owner node['nsd']['user']
  group node['nsd']['group']
  mode '0755'
end

if node['nsd']['zone_lists']
  node['nsd']['zone_lists'].each_pair do |zone_name, value|
    cookbook_file node['nsd']['etc'] + "/zones/" + zone_name + ".zone" do
      source node['nsd']['zones_dir'] + "/" + zone_name + ".zone"
      owner node['nsd']['user']
      group node['nsd']['group']
      mode '0644'
      notifies :reload, 'service[' + node['nsd']['service'] + ']'
    end
  end
end

service node['nsd']['service'] do
  action [:enable, :start]
  supports :reload => true, :status => true, :restart => true, :rebuild => true
end
