default['mysqld']['package'] = 'mysql-server'
default['mysqld']['owner'] = 'mysql'
default['mysqld']['group'] = 'mysql'

case node[:platform]
when 'centos'
  default['mysqld']['service'] = 'mysqld'
when 'ubuntu'
  default['mysqld']['service'] = 'mysql'
end
 
default['mysqld']['etc'] = '/etc'
default['mysqld']['lib'] = '/var/lib/mysql'
default['mysqld']['conf_lists']['mysqld'] = {
  'datadir' => '/var/lib/mysql',
  'socket' => node['mysqld']['lib'] + "/mysql.sock",
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
  'server-id' => '1',
  'default-character-set' => 'utf8'
}
default['mysqld']['conf_lists']['mysql'] = {
  'default-character-set' => 'utf8'
}
default['mysql']['repo'] = nil
