default['nginx']['pkg_name'] = 'nginx'
default['nginx']['service'] = 'nginx'
default['nginx']['etc'] = node['base']['etc'] + '/nginx'
default['nginx']['include_dir'] = node['nginx']['etc'] + '/conf.d'
default['nginx']['conf_list'] = Array.new

case node[:platform]
when 'centos'
  default['nginx']['pkg_options'] = '--enablerepo=epel'
end

