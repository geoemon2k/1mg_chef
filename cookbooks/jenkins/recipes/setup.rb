#
# Cookbook Name:: jenkins
# Recipe:: setup
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "java-1.6.0-openjdk" do
  action :install
end

template node['base']['etc'] + '/yum.repos.d/jenkins.repo' do
  source "jenkins.repo.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[jenkins]"
end

execute "set_jenkins-ci.org_key" do
  command "rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
  action :run
end

package "jenkins" do
  action :install
  options '--enablerepo=jenkins'
end

template node['base']['etc'] + '/sysconfig/jenkins' do
  source "sysconfig_jenkins.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[jenkins]"
end

service "jenkins" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
