node.default['remi']['gpgkey'] = "RPM-GPG-KEY-remi"
node.default['remi']["gpg"] = "http://rpms.famillecollet.com/#{node['remi']['gpgkey']}"
node.default['remi']["rpm"] = "http://rpms.famillecollet.com/enterprise/remi-release-#{node['platform_version'].to_i}.rpm"
