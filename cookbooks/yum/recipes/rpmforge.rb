execute "install-rpmforge-key" do
  action :run
  command "rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt"
  not_if 'ls /etc/pki/rpm-gpg/RPM-GPG-KEY.dag'
end

execute "install-rpmforge" do
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
  execute "enable-rpmforge" do
    action :run
    command "sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/remi"
    only_if "grep 'enabled=0' /etc/yum.repos.d/remi"
  end
end