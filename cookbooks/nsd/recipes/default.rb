package 'nsd' do
  action :install
  options '--enablerepo=epel'
end

cookbook_file '/etc/nsd/nsd.conf' do
  source 'nsd.conf'
  notifies :restart, 'service[nsd]'
end

template '/etc/nsd/other.conf' do
  source 'other.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :zones => node[:zones]
  })
  notifies :restart, 'service[nsd]'
end

directory "/etc/nsd/zones" do
  action :create
  owner 'nsd'
  group 'nsd'
  mode '0755'
end

service 'nsd' do
  action [:enable, :start]
end
