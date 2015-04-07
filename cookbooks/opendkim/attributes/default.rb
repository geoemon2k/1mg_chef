default['opendkim']['pkg_name'] = 'opendkim'
default['opendkim']['service'] = 'opendkim'
default['opendkim']['etc'] = node['base']['etc'] + '/opendkim'
default['opendkim']['keys_dir'] = node['opendkim']['etc'] + '/keys'
default['opendkim']['conf_list'] = Array.new
default['opendkim']['user'] = 'opendkim'
default['opendkim']['group'] = 'opendkim'

case node[:platform]
when 'centos'
  default['opendkim']['pkg_options'] = '--enablerepo=epel'
end
