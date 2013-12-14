default['base']['stop_services'] = Array.new
default['base']['root_address'] = 'keiji.ue@gmail.com'
default['base']['etc'] = '/etc'

case node[:platform]
when 'centos', 'fedora'
  default['base']['sysconfig'] = '/etc/sysconfig'
  default['base']['off_services'] = Array.new
  default['base']['on_services'] = Array.new
end
