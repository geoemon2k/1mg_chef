default['nsd']['dir'] = '/etc/nsd/'
default['nsd']['package'] = 'nsd'
default['nsd']['user'] = 'nsd'
default['nsd']['group'] = 'nsd'
default['nsd']['zones_dir'] = 'zones/'

case node[:platform]
when 'centos'
  default['nsd']['repo_source'] = 'epel'
when 'ubuntu'
  default['nsd']['dir'] = '/etc/nsd3/'
  default['nsd']['package'] = 'nsd3'
end

default['nsd']['zone_list'] = nil
case node[:platform]
when "centos", "fedora"
  default['nsd']['install_option'] = "--enablerepo=epel"
else
  default['nsd']['install_option'] = Array.new
end

