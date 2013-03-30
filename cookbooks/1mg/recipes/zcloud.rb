service 'ip6tables' do
  action [:disable, :stop]
end

service 'lvm2-monitor' do
  action [:disable, :stop]
end

service 'messagebus' do
  action [:disable, :stop]
end

service 'redis' do
  action [:disable, :stop]
end

service 'udev-post' do
  action [:disable, :stop]
end
