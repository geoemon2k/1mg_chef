default['php_mbcrypt']['package'] = 'php_mbstring'
default['php_mbcrypt']['repo_source'] = nil

case node[:platform]
when 'centos'
  default['php_mbcrypt']['repo_source'] = 'epel'
end