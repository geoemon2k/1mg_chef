default['fluentd']['packages'] = [{
  "name": "td-agent",
  "options": "--enablerepo=treasuredata"
  }, {
  "name": "td-libyaml",
  "options": "--enablerepo=treasuredata"
}]
default['fluentd']['service'] = 'td-agent'
default['fluentd']['etc'] = node['base']['etc'] + '/td-agent'
