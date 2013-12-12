case node[:kernel][:machine]
when "i686"
  default['yum']['epel']['os_type'] = "i386"
else
  default['yum']['epel']['os_type'] = "x86_64"
end
if node[:platform_version].to_i > 5
  default['yum']['epel']['url'] = "http://ftp.iij.ad.jp/pub/linux/fedora/epel/#{node[:platform_version].to_i}/#{default['yum']['epel']['os_type']}/epel-release-6-8.noarch.rpm"
else
  default['yum']['epel']['url'] = "http://ftp.iij.ad.jp/pub/linux/fedora/epel/#{node[:platform_version].to_i}/#{default['yum']['epel']['os_type']}/epel-release-5-4.noarch.rpm"
end

default['yum']['epel']['gpg_keyname'] = "RPM-GPG-KEY-EPEL-#{node[:platform_version].to_i}"
default['yum']['epel']['disabled'] = true
