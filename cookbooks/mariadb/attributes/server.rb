default['mariadbd']['package'] = 'mariadb-server'
default['mariadbd']['service'] = 'mariadb'
default['mariadbd']['owner'] = 'mysql'
default['mariadbd']['group'] = 'mysql'

case node[:platform]
when 'centos', 'ubuntu'
end
 
default['mariadbd']['etc'] = '/etc'
default['mariadbd']['lib'] = '/var/lib/mysql'
default['mariadbd']['conf_lists']['mariadbd'] = {
  'socket' => node['mariadbd']['lib'] + "/mysql.sock",
  'user' => 'mysql',
  'datadir' => '/usr/local/1mg/var/lib/mysql',
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
default['mariadbd']['conf_lists']['mariadb'] = {
  'default-character-set' => 'utf8'
}
default['mariadb']['repo'] = nil
