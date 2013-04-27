package 'sendmail' do
  action :install
end

service 'sendmail' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
