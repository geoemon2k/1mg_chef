#
# Cookbook Name:: jenkins
# Recipe:: setup_plugins
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "set_cli" do
	command "wget -O /var/lib/jenkins/jenkins-cli.jar http://localhost:80/jenkins/jnlpJars/jenkins-cli.jar"
	action :run
	only_if do File.exists?("/var/lib/jenkins/jenkins-cli.jar") end
end

if node['jenkins']['plugins'] != nil
	node['jenkins']['plugins'].each do |plugin|
		execute "plugins_" + plugin do
      command "java -jar /var/lib/jenkins/jenkins-cli.jar -s http://localhost:80/jenkins install-plugin " + plugin
      action :run
    end
  end
end    