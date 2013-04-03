node.default['phpfpm']['pm'] = 'dynamic'
node.default['phpfpm']['user'] = 'nginx'
node.default['phpfpm']['group'] = 'nginx'
node.default['phpfpm']['listen'] = '/tmp/php-fpm.socket'
node.default['phpfpm']['start_servers'] = '2'
node.default['phpfpm']['min_spare_servers'] = '2'
node.default['phpfpm']['max_spare_servers'] = '5'
node.default['phpfpm']['max_children']= '5'

