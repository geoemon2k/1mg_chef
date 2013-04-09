execute "install-remi-key" do
  action :run
  command "rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi"
  not_if 'ls /etc/pki/rpm-gpg/RPM-GPG-KEY-remi'
end

execute "install-remi" do
  action :run
  command "rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-#{node['platform_version'].to_i}.rpm"
  not_if "rpm -q remi-release"
end

if node['yum']['remi']['disabled']
  execute "disable-remi" do
    action :run
    command "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi"
    only_if "grep 'enabled=1' /etc/yum.repos.d/remi"
  end
else
  execute "enable-remi" do
    action :run
    command "sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/remi"
    only_if "grep 'enabled=0' /etc/yum.repos.d/remi"
  end
end