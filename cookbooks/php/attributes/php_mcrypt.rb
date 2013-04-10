default['php_mcrypt']['package'] = 'php_mbstring'
default['php_mcrypt']['repo_source'] = nil

case node[:platform]
when 'centos'
  default['php_mcrypt']['repo_source'] = 'epel'
end