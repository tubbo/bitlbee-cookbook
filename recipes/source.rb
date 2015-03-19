#
# Cookbook Name:: bitlbee
# Recipe:: default
#
# Installs Bitlbee from source
#
# Copyright (C) 2015 Tom Scott
#
# All rights reserved - Do Not Redistribute
#

source_location = File.join Chef::Config[:cache_path], 'bitlbee'

service 'bitlbee' do
  action :enable
end

git source_location do
  repository node['bitlbee']['repository']
  branch node['bitlbee']['branch']
end

execute 'apt-get build-dep -y bitlbee' do
  only_if { node['bitlbee']['install_dependencies'] }
end

execute './configure && make && make install' do
  cwd source_location
  notifies :restart, 'service[bitlbee]'
end

include_recipe 'bitlbee::default'
