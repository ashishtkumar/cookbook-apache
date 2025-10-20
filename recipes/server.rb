#
# Cookbook:: cookbook-apache
# Recipe:: server
#
# Copyright:: 2025, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end 

file '/var/www/html/index.html' do
  content '<h1>Hello, world!</h1>'
end

#service 'httpd' do
#  action [:enable, :start]
#  provider Chef::Provider::Service::Systemd
#end

execute 'start_httpd' do
  command 'httpd'
  not_if 'pgrep httpd'
end
