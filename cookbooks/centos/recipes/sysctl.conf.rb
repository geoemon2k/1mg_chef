if node['centos']['sysctl.conf'] != nil
  node['centos']['sysctl.conf'].each do |params|
    bash "change sysctl.conf_#{params['name']}" do
      code <<-EOH
        sed -i -e "s/#{params['name']} =.*/#{params['name']} = #{params['value']}/g" /etc/sysctl.conf
        sysctl #{params['name']}=#{params['value']}
      EOH
    end
  end
end
