default['nsd']['etc'] = '/etc/nsd'
default['nsd']['pkg_name'] = 'nsd'
default['nsd']['service'] = 'nsd'
default['nsd']['zones_dir_name'] = 'zones'
default['nsd']['zones_dir'] = node['nsd']['etc'] + '/' + node['nsd']['zones_dir_name']
default['nsd']['zones'] = Hash.new
case node[:platform]
when 'centos'
  default['nsd']['pkg_options'] = '--enablerepo=epel'
when 'ubuntu'
  default['nsd']['etc'] = '/etc/nsd3'
  default['nsd']['pkg_name'] = 'nsd3'
end
