package node['mysqld']['package'] do
  action :install
  if node['mysqld']['install_option']
    options node['mysqld']['install_option']
  end
end

template node['base']['etc'] + '/my.cnf' do
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[' + node['mysqld']['service'] + ']'
end

service node['mysqld']['service'] do
  action [:enable, :start]
  supports :status => true, :restart => true
end
