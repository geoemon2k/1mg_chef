include_attribute "base::default"

node.default['iptables']['port']['tcp'] = {
  '22' => ['0.0.0.0/0'],
  '80' => ['0.0.0.0/0'],
  '53' => ['0.0.0.0/0'],
  '21' => ['164.46.1.252'],
}

case node[:platform]
when 'centos'
  default['iptables']['etc'] = node['base']['sysconfig']
end
