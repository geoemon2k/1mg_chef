case node[:platform]
when "fedora", "centos", "redhat"
  default['monit']['etc'] = "/etc/"
  default['monit']['options'] = "--enablerepo=rpmforge"
end

default['monit']['monit.d'] = "#{default['monit']['etc']}/monit.d/"
