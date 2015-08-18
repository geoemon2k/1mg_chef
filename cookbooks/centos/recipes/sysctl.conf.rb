if node['centos']['sysctl.conf'] != nil
  if node['platform'] == 'centos'
    template '/etc/sysctl.conf' do
      source 'sysctl.conf.cent' + node['platform_version'].to_i + '.erb'
      owner 'root'
      group 'root'
      mode '0644'
      variables {
        sysctl => node['centos']['sysctl.conf']
      }
    end
  end

  node['centos']['sysctl.conf'].each do |sysctl_params|
    if sysctl_params['name'].nil? == false && sysctl_params['value'].nil? == false
      execute 'exec sysctl' do
        command "sysctl #{sysctl_params['name']}=#{sysctl_params['value']}"
        creates '/tmp/something'
        action :run
      end
    end
  end  
end
