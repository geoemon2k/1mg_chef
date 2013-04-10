default['sshd']['package'] = 'openssh-server'
default['sshd']['dir'] = '/etc/ssh/'
default['sshd']['service_name'] = 'sshd'
case node[:platform]
when "ubuntu"
  default['sshd']['service_name'] = 'ssh'
end
default['sshd']['conf_lists'] = nil