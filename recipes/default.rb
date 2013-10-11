# Apt #################################################################################

include_recipe "apt"

# Java ################################################################################

node.override['java']['install_flavor'] = 'oracle'
node.override['java']['oracle']['accept_oracle_download_terms'] = true
node.override['java']['jdk_version'] = '6'
node.override['java']['url'] = 'jdk-6u45-linux-x64.bin'

include_recipe "java"

# jRuby via rbenv #############################################################

node.override['rbenv']['group_users'] = ['vagrant']

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "jruby-1.7.3"

rbenv_gem "bundler" do
  ruby_version "jruby-1.7.3"
end

# Hadoop ##############################################################################

include_recipe "single_node_hadoop_claster"
