package node['mysqld']['package'] do
  action :install
  if node['mysqld']['install_option']
    options node['mysqld']['install_option']
  end
end

template '/etc/my.cnf' do
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mysqld]'
end

service 'mysqld' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
