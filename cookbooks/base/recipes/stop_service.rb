if node['base']['stop_services']
  node['base']['stop_services'].each do |service_name|
    service service_name do
      action [:disable, :stop]
    end
  end
end