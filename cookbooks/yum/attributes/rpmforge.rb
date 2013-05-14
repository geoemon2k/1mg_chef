case node[:kernel][:machine]
when "i686"
  if node[:platform_version].to_i > 5
    default['yum']['rpmforge']['os_type'] = "i686"
  else
    default['yum']['rpmforge']['os_type'] = "i386"
  end
else
  default['epel']['os_type'] = "x86_64"
end
default['yum']['rpmforge']['url'] = "http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el#{node[:platform_version].to_i}.rf.#{default['epel']['os_type']}.rpm"
default['yum']['rpmforge']['gpg_keyname'] = "RPM-GPG-KEY.dag.txt"
default['yum']['rpmforge']['gpg_url'] = "http://apt.sw.be/#{node['yum']['rpmforge']['gpg_keyname']}"
default['yum']['rpmforge']['disabled'] = false
