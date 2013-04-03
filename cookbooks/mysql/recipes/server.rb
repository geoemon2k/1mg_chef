package 'mysql-server' do
  action :install
  if node['mysql']['repo']
    options '--enablerepo='+node['mysql']['repo']
  end
end

template '/etc/my.cnf' do
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :mysqld => node['mysqld']
  })
  notifies :restart, 'service[mysqld]'
end

service 'mysqld' do
  action [:enable, :start]
end
