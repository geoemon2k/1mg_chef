default['sshd']['pkg_name'] = 'openssh-server'
default['sshd']['etc'] = '/etc/ssh'
case node[:platform]
when "ubuntu"
  default['sshd']['service'] = 'ssh'
else
  default['sshd']['service'] = 'sshd'
end
default['sshd']['conf_lists'] = nil
default['sshd']['sshd_config'] = node['sshd']['etc'] + '/sshd_config'
