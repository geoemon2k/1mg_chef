options = nil
case node[:platform]
when "centos"
  pkg_name = 'nsd'
  etc_path = '/etc/nsd/'
  options = '--enablerepo=epel'
when "ubuntu"
  pkg_name = 'nsd3'
  etc_path = '/etc/nsd3/'
end

package "#{pkg_name}" do
  action :install

  if "#{options}" != nil
    options "#{options}"
  end
end

template "#{etc_path}nsd.conf" do
  source 'nsd.conf.erb'
  owner 'root'
  group 'root'
  variables({
    :etc_path => etc_path
  })
  notifies :restart, 'service[nsd]'
end

template "#{etc_path}other.conf" do
  source 'other.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :nsd => node[:nsd]
  })
  notifies :restart, 'service[nsd]'
end

directory "#{etc_path}zones" do
  action :create
  owner 'nsd'
  group 'nsd'
  mode '0755'
end

node.nsd.zone_lists.each_pair do |zone_name, value|
  cookbook_file "#{etc_path}zones/#{zone_name}.zone" do
    source "zones/#{zone_name}.zone"
    owner 'nsd'
    group 'nsd'
    mode '0644'
    notifies :rebuild, 'service[nsd]'
    notifies :reload, 'service[nsd]'
  end
end

service 'nsd' do
  action [:enable, :start]
  supports :reload => true, :status => true, :restart => true, :rebuild => true
end
