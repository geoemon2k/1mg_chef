package node['mysqld']['package'] do
  action :install
  if node['mysqld']['repo_source']
    options '--enablerepo='+node['mysql']['repo_source']
  end
end

template '/etc/my.cnf' do
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :conf_options => node['mysqld']['conf_options']
  })
  notifies :restart, 'service[mysqld]'
end

service 'mysqld' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
