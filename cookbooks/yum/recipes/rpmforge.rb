execute "install-rpmforge-key" do
  action :run
  command "rpm --import #{node['yum']['rpmforge']['gpg_url']}"
  not_if "ls /etc/pki/rpm-gpg/#{node['yum']['rpmforge']['gpg_keyname']}"
end

execute "install-rpmforge" do
  action :run
  command "rpm -ivh #{node['yum']['rpmforge']['url']}"
  not_if "rpm -q rpmforge-release"
end

if node['yum']['rpmforge']['disabled']
  execute "disable-rpmforge" do
    action :run
    command "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/rpmforge.repo"
    only_if "grep 'enabled=1' /etc/yum.repos.d/rpmforge.repo"
  end
else
  execute "enable-rpmforge" do
    action :run
    command "sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/rpmforge.repo"
    only_if "grep 'enabled=0' /etc/yum.repos.d/rpmforge.repo"
  end
end