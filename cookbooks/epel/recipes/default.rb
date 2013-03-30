execute "install_epel_gpg-key" do
  action :run
  command "rpm --import #{node.epel.gpg}"
  not_if "ls /etc/pki/rpm-gpg/#{node.epel.gpgkey}"
end

execute "install_epel_repo" do
  action :run
  command "rpm --install #{node.epel.rpm}"
  not_if 'rpm -q epel-release'

end

execute "disable_epel_repo" do
  action :run
  command "sed -i -e 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo"
  only_if 'grep "enabled=1" /etc/yum.repos.d/epel.repo'
end
