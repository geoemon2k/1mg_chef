#
# Cookbook Name:: php
# Recipe:: setup_php.ini
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "common::common"
include_recipe "httpd::common"
include_recipe "php::common"


# service_codeが設定されていなければ変更処理をスキップする
if node['common_bags']['config_list']['config_info'].nil? == false &&
  node['common_bags']['config_list']['config_info']['service_code'].nil? == false

  tuning_info = node['php']['tuning_default']
  course_match = false
  # コースによるチューニング設定が存在するかどうか
  node['php']['tuning_info'].each_pair do |course_list, course_params|
    if course_list.include?(node['common_bags']['config_list']['config_info']['service_code']) == true
      # コース毎のパラメータを取得して差し替え
      tuning_info.each_pair do |key, value|
        if course_params[key] != nil
          tuning_info.store(key, course_params[key])
        end
      end
      course_match = true
    end
  end
  # コースによるチューニング設定が存在するかどうか
  if course_match == false
    raise ::ZenlogicStandardError::InvalidParameterValue, "undefined course parameters '#{node['common_bags']['config_list']['config_info']['service_code']}' "
  end

  # change php.ini
  template node['php']['etc'] + '/php.ini' do
    source 'php.ini.erb'
    owner 'root'
    group 'root'
    mode 00644
    variables({
      :tuning_info => tuning_info
      })
    if node['httpd_bags']['state'] == true
      notifies :reload, 'service[' + node['httpd']['service'] + ']'
    end
  end
end
