# Apt #################################################################################

include_recipe "apt"

# Java ################################################################################

#TODO Use attributes instead of hardcoded "vagrant". 
["/tmp/vagrant-chef", "/tmp/vagrant-chef-cache"].each do |dir|
  directory dir do
    owner "vagrant"
    group "vagrant"
    mode "0755"
    action :create
  end
end

node.override['java']['install_flavor'] = 'oracle'
node.override['java']['oracle']['accept_oracle_download_terms'] = true
node.override['java']['jdk_version'] = '6'
node.override['java']['url'] = 'jdk-6u45-linux-x64.bin'

include_recipe "java"

# jRuby ###############################################################################

node.override['rvm']['default_ruby'] = 'jruby-1.7.3'
node.override['rvm']['rubies'] = ["jruby-1.7.3"]
node.override['rvm']['group_users'] = ['vagrant']

include_recipe "rvm::system"

bash "append to /etc/environment" do
  user "root"
  code <<-EOF
    echo "JRUBY_OPTS=--1.9" >> /etc/environment
  EOF
  not_if "grep -q JRUBY_OPTS /etc/environment"
end

# Hadoop ##############################################################################

