package "iptables" do
  action :install
end

case node[:platform]
  when 'centos'
  template '/etc/sysconfig/iptables' do
  source 'iptables/iptables.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :iptables => node[:iptables]
  })
  notifies :restart, 'service[iptables]'
  end
end

service 'iptables' do
  action [:enable, :start]
end
  
