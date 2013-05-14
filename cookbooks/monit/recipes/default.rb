package "monit" do
  action :install
  if node['monit']['options']
    options = node['monit']['options']
  end
end

template  node['monit']['etc']+'monit.conf' do
  source 'monit.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[monit]'
end

service 'monit' do
  action [:enable, :start]
  supports :restart => true, :status => true
end
