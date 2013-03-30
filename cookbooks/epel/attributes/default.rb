if node['platform_version'].to_i > 5
  node.default['epel']["rpm"] = "http://ftp.iij.ad.jp/pub/linux/fedora/epel/#{node['platform_version'].to_i}/#{node['kernel']['machine']}/epel-release-6-8.noarch.rpm"
else
  node.default['epel']["rpm"] = "http://ftp.iij.ad.jp/pub/linux/fedora/epel/#{node['platform_version'].to_i}/#{node['kernel']['machine']}/epel-release-5-4.noarch.rpm"
end
node.default['epel']['gpgkey'] = "RPM-GPG-KEY-EPEL-#{node['platform_version'].to_i}"
node.default['epel']["gpg"] = "http://ftp.iij.ad.jp/pub/linux/fedora/epel/#{node['gpgkey']}"
