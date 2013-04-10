default['nginx']['dir'] = '/etc/nginx/'
  
case node[:platform]
when 'centos'
  default['nginx']['user'] = 'nginx'
  default['nginx']['group'] = 'nginx'
  default['nginx']['include_dir'] = 'conf.d/'
  default['nginx']['repo_source'] = 'epel'
end
