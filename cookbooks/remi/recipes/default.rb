execute "install-remi-key" do
  action :run
  command "rpm --import #{node.remi.gpg}"
  not_if 'ls /etc/pki/rpm-gpg/#{node.remi.gpgkey}'
end

execute "install-remi" do
  action :run
  command "rpm -ivh #{node.remi.rpm}"
  not_if "rpm -q remi-release"
end

execute "disable-remi" do
  action :run
  command "sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi"
  only_if "grep 'enabled=1' /etc/yum.repos.d/remi"
end
