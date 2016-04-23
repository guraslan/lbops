#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'



#cookbook_file "/etc/hosts" do
#   source "hosts"
#   mode "0644"
#end


package 'nginx' do
  action :install
end


cookbook_file "/etc/nginx/sites-enabled/app" do
   source "nginx_app.conf"
   mode "0644"
   notifies :restart, "service[nginx]", :delayed
end

file "/etc/nginx/sites-enabled/default" do
   action :delete
   notifies :restart, "service[nginx]", :delayed
end

service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file "/usr/share/nginx/html/index.html" do
  source "index.html"
  mode "0644"
end


