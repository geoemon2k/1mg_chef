#
# Cookbook Name:: docker
# Recipe:: centos
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when 'centos'
  remote_file "/tmp/docker.master.zip" do
    source "https://github.com/hagix9/docker-centos-rpm/archive/master.zip"
    not_if do File.exists?("/tmp/docker.master.zip") end
  end

  bash "unzip docker.master.zip" do
    code <<-EOH
      cd /tmp;unzip /tmp/docker.master.zip
    EOH
    not_if do File.directory?("/tmp/docker-centos-rpm-master/") end
  end

  bash "install kernel-ml-aufs" do
    code <<-EOH
      rpm -Uvh /tmp/docker-centos-rpm-master/kernel-ml-aufs-*.rpm
    EOH
    not_if "rpm -q kernel-ml-aufs"
  end

  bash "rewrite grub.com" do
    code <<-EOH
      sed -i -e "s/default=.*/default=0/g" /boot/grub/grub.conf
    EOH
  end
end
