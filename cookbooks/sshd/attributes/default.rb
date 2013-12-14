default['sshd']['pkg_name'] = 'openssh-server'
default['sshd']['etc'] = '/etc/ssh'
default['sshd']['service'] = 'sshd'
case node[:platform]
when "ubuntu"
  default['sshd']['service'] = 'ssh'
end
default['sshd']['conf_lists'] = nil
default['sshd']['sshd_config'] = node['sshd']['etc'] + '/sshd_config'