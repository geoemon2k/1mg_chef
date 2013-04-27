default['1mg']['root_address'] = 'keiji.ue@gmail.com'
case node[:platform]
when centos', 'fedora'
  default['1mg']['stop_services'] = [
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
else
  default['1mg']['stop_services'] = Array.new
end
