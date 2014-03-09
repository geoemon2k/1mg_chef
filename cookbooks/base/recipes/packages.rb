#
# Cookbook Name:: base
# Recipe:: packages
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node['base']['packages'] != nil
  node['base']['packages'].each do |package_info|
    package package_info['name'] do
      if package_info['options'] != nil
        options package_info['options']
      end
      if package_info['version'] != nil
        version package_info['version']
      end
    end
  end
end
