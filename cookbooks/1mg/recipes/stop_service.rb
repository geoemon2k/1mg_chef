if node['1mg']['stop_services']
node['1mg']['stop_services'].each do |service_name|
  service service_name do
    action [:disable, :stop]
  end
end