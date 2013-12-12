default['base']['stop_services'] = Array.new
default['base']['root_address'] = 'keiji.ue@gmail.com'

case node[:platform]
when 'centos', 'fedora'
  default['base']['stop_services'] = [
    'saslauthd',
    'xinetd',
    'smadmd',
    'serversman',
    'httpd',
    'ajaxterm',
    'netfs',
    'rpcbind',
    'ip6tables',
    'lvm2-monitor',
    'messagebus',
    'redis',
    'udev-post'
  ]
end
