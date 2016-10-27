default['base']['stop_services'] = Array.new
default['base']['root_address'] = 'root@localhost'
default['base']['etc'] = '/etc'
default['base']['hostname'] = 'localhost'
default['base']['bk_dbnames'] = ["wp", "phpbb", "mysql" ]
default['base']['1mg_dir'] = '/usr/local/1mg'
default['base']['init.d'] = '/etc/init.d/'
case node[:platform]
when 'centos', 'fedora'
  default['base']['sysconfig'] = '/etc/sysconfig'
  default['base']['off_services'] = Array.new
  default['base']['on_services'] = Array.new
end
default['base']['packages'] = [{
  'name' => 'zsh',
  'name' => 'dnsutils'
}]
