default['mysqld']['package'] = 'mysql-server'
default['mysqld']['service'] = 'mysqld'
default['mysqld']['owner'] = 'mysql'
default['mysqld']['group'] = 'mysql'

case node[:platform]
when 'centos', 'ubuntu'
end
 
default['mysqld']['etc'] = '/etc'
default['mysqld']['lib'] = '/var/lib/mysql'
default['mysqld']['conf_lists'] = {
  'datadir' => '/var/lib/mysql',
  'socket' => node['mysqld']['lib'] + "/mysql.sock",
  'user' => 'mysql',
  'datadir' => node['mysqld']['lib'],
  'bind-address' => '127.0.0.1',
  'key_buffer_size' => '8K',
  'max_allowed_packet' => '1M',
  'table_open_cache' => '2',
  'sort_buffer_size' => '32K',
  'read_buffer_size' => '128K',
  'read_rnd_buffer_size' => '128K',
  'net_buffer_length' => '2K',
  'thread_stack' => '64K',
  'max_connections' => '2',
  'server-id' => '1'
}
default['mysql']['repo'] = nil