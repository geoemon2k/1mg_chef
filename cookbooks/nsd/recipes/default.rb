package node['nsd']['package'] do
  action :install

  if node['nsd']['repo_source'] != nil
    options "--enablerepo="+node['nsd']['repo_source']
  end
end

template node['nsd']['dir']+"nsd.conf" do
  source 'nsd.conf.erb'
  owner 'root'
  group 'root'
  variables({
    :dir => node['nsd']['dir']
  })
  notifies :restart, 'service[nsd]'
end

template node['nsd']['dir']+"other.conf" do
  source 'other.conf.erb'
  owner node['nsd']['user']
  group node['nsd']['group']
  mode '0644'
  variables({
    :zone_lists => node['nsd']['zone_lists']
  })
  notifies :restart, 'service[nsd]'
end

directory node['nsd']['dir']+node['nsd']['zones_dir'] do
  action :create
  owner node['nsd']['user']
  group node['nsd']['group']
  mode '0755'
end

if node['nsd']['zone_lists']
  node['nsd']['zone_lists'].each_pair do |zone_name, value|
    cookbook_file node['nsd']['dir']+"zones/#{zone_name}.zone" do
      source node['nsd']['zones_dir']+"#{zone_name}.zone"
      owner node['nsd']['user']
      group node['nsd']['group']
      mode '0644'
      notifies :reload, 'service[nsd]'
    end
  end
end

service 'nsd' do
  action [:enable, :start]
  supports :reload => true, :status => true, :restart => true, :rebuild => true
end
