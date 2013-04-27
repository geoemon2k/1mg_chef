node['nsd']['zone_list'].each_pair do |zone_name, value|
  cookbook_file "/etc/nsd/zones/"+zone_name+".zone" do
    source "zones/"+zone_name+".zone"
    owner 'nsd'
    group 'nsd'
    mode '0644'
    notifies :rebuild, 'service[nsd]'
    notifies :restart, 'service[nsd]'
  end
end
