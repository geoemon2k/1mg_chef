template '/etc/php-fpm.d/www.conf' do
  source 'www.conf.erb'
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, 'service[php-fpm]'
end

service "php-fpm" do
  action [:enable, :start]
end
