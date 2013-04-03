#
# Cookbook Name:: pcre
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node.pcre.moduless.each do |module|
  execute "install_pcre_#{module}" do
      action :run
      command "pcre install #{module}"
    not_if "pcre info ${module}"
  end
end
