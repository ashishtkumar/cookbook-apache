#
# Cookbook:: cookbook-apache
# Recipe:: server
#
# Copyright:: 2025, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end 

remote_file '/var/www/html/nature.png' do
  source 'https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?auto=compress&cs=tinysrgb&h=350'
end

cookbook_file '/var/www/html/home.html' do
  source 'home.html'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
end

#service 'httpd' do
#  action [:enable, :start]
#  provider Chef::Provider::Service::Systemd
#end

execute 'start_httpd' do
  command 'httpd'
  not_if 'pgrep httpd'
end
