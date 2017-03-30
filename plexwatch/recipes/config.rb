#
# Cookbook:: plexwatch
# Recipe:: config
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory '/opt/plexWatch' do
  mode '0777'
  action :create
end

template '/opt/plexWatch/plexWatch.pl' do
  source 'plexWatch.erb'
  mode '0755'
  action :create
end

template '/opt/plexWatch/config.pl' do
  source 'config.erb'
  action :create
  variables(
    provider_key: node['plexwatch']['key']
  )
end

cron 'plexWatch' do
  command '/opt/plexWatch/config.pl --recently_added=movie,tv'
end
