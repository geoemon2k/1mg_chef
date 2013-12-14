default['spawnfcgi']['socket'] = '/var/run/php-fcgi.sock'
default['spawnfcgi']['owner'] = 'apache'
default['spawnfcgi']['group'] = 'apache'
default['spawnfcgi']['num'] = '32'
default['spawnfcgi']['pid'] = '/var/run/spawn-fcgi.pid'
default['spawnfcgi']['pkg_name'] = 'spawn-fcgi'
case node[:platform]
when 'centos'
  default['spawnfcgi']['pkg_options'] = '--enablerepo=epel'
end