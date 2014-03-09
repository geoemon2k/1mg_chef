if node['centos']['selinux'] != nil
  bash "change selinux to #{node['centos']['selinux']}" do
    code <<-EOH
      sed -i -e "s/SELINUX=.*/SELINUX=#{node['centos']['selinux']}/" /etc/selinux/config
    EOH
  end
#  if node['centos']['selinux'] == 'disabled'
#    bash 'disabled selinux' do
#      code <<-EOH
#        setenforce 0
#      EOH
#    end
#  else
#    bash "enabled selinux" do
#      code <<-EOH
#        setenforce 1
#      EOH
#    end
#  end
end
