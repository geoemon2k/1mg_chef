default['vsftpd']['pkg_name'] = 'vsftpd'
default['vsftpd']['service'] = 'vsftpd'
default['vsftpd']['etc'] = node['base']['etc'] + '/vsftpd'
default['vsftpd']['include_dir'] = node['vsftpd']['etc'] + '/conf.d'
default['vsftpd']['conf_list'] = Array.new

case node[:platform]
when 'centos'
end

