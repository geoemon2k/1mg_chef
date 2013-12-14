default['nsd']['etc'] = '/etc/nsd'
default['nsd']['pkg_name'] = 'nsd'
default['nsd']['service'] = 'nsd'
default['nsd']['user'] = 'nsd'
default['nsd']['group'] = 'nsd'
default['nsd']['zones_dir'] = 'zones'
default['nsd']['zone_list'] = nil
case node[:platform]
when 'centos'
  default['nsd']['pkg_options'] = '--enablerepo=epel'
when 'ubuntu'
  default['nsd']['etc'] = '/etc/nsd3'
  default['nsd']['pkg_name'] = 'nsd3'
end
