include_attribute "base::default"

node.default['iptables']['port']['tcp'] = {
  '22' => ['0.0.0.0/0'],
  '80' => ['0.0.0.0/0'],
  '53' => ['0.0.0.0/0'],
  '21' => ['127.0.0.1']
}

node.default['iptables']['port']['udp'] = {
  '53' => ['0.0.0.0/0']
}

case node[:platform]
when 'centos'
  default['iptables']['etc'] = node['base']['sysconfig']
end
