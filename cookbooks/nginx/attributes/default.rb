default['nginx']['etc'] = '/etc/nginx'
  
case node[:platform]
when 'centos'
  default['nginx']['user'] = 'nginx'
  default['nginx']['group'] = 'nginx'
  default['nginx']['include_dir'] = 'conf.d/'
  default['nginx']['options'] = '--enablerepo=epel'
end

default['nginx']['conf_list'] = ['server.1mg.org.conf', 'www.1mg.org.conf']
