service 'saslauthd' do
  action [:disable, :stop]
end

service 'xinetd' do
  action [:disable, :stop]
end

service 'smadmd' do
  action [:disable, :stop]
end

service 'serversman' do
  action [:disable, :stop]
end

service 'httpd' do
  action [:disable, :stop]
end

service 'ajaxterm' do
  action [:disable, :stop]
end

service 'netfs' do
  action [:disable, :stop]
end

service 'rpcbind' do
  action [:disable, :stop]
end

