default['base']['stop_services'] = Array.new
default['base']['root_address'] = 'root@localhost'
default['base']['etc'] = '/etc'
default['base']['hostname'] = 'localhost'

case node[:platform]
when 'centos', 'fedora'
  default['base']['sysconfig'] = '/etc/sysconfig'
  default['base']['off_services'] = Array.new
  default['base']['on_services'] = Array.new
end
