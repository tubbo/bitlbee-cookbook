#
# Cookbook Name:: bitlbee
# Recipe:: default
#
# Configures Bitlbee after install
#
# Copyright (C) 2015 Tom Scott
#
# All rights reserved - Do Not Redistribute

service :bitlbee do
  action :enable
end
