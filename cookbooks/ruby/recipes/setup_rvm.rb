['curl', 'curl-devel', 'gcc', 'gcc-c++', 'git', 'openssl-devel', 'httpd-devel', 'readline-devel', 'tk-devel', 'make', 'zlib-devel', 'libffi-devel'].each do |pkg|
  package pkg do
    action :install
    not_if "which rvm"
  end
end

package 'libyaml-devel' do
  options '--enablerepo=epel'
  action :install
  not_if "which rvm"
end

execute 'setup_rvm' do
  command "curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer|bash -s stable"
  action :run
  not_if "which rvm"
end

execute "set_env_path" do
  action :run
  command "echo 'export PATH=\$PATH:/usr/local/rvm/bin' >> ~/.bashrc"
  not_if "grep '/usr/local/rvm/bin' ~/.bashrc"
  notifies :run, "execute[read_bashrc]"
end

execute "read_bashrc" do
  command "source ~/.bashrc"
  action :nothing
end
