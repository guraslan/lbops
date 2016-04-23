#
# Cookbook Name:: appserver
# Recipe:: deploy
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "Copy new go server" do
  path "/opt/app/server"
  source "file:///vagrant/code/server"
  owner 'nobody'
  group 'root'
  mode 0755
  notifies :run, 'bash[deploy go application]', :immediate
end

bash 'deploy go application' do
  user 'nobody'
  cwd '/opt/app'
  code <<-EOH
  kill `cat server.pid`
  ./server &
  echo $! > server.pid
  EOH
end
