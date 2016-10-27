default['php']['package'] = Array.new
default['php']['service'] = 'httpd'
default['php']['spawnfcgi']['socket'] = '/var/run/php-fcgi.sock'
default['php']['spawnfcgi']['owner'] = 'nginx'
default['php']['spawnfcgi']['group'] = 'nginx'
default['php']['spawnfcgi']['num'] = '32'
default['php']['spawnfcgi']['pid'] = '/var/run/spawn-fcgi.pid'
default['php']['spawnfcgi']['pkg_name'] = 'spawn-fcgi'
default['php']['spawnfcgi']['service'] = 'spawn-fcgi'
case node[:platform]
when 'centos'
  default['php']['spawnfcgi']['pkg_options'] = '--enablerepo=epel'
end
