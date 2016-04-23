#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package 'golang' do
  action :install
end


directory '/opt/app' do
  owner 'nobody'
  group 'root'
  mode '0755'
  action :create
end


#cookbook_file "/opt/app/server.go" do
#  source "server.go"
#  mode "0644"
#end

#file "/opt/app/server" do
#   source "/vagrant/code/server"
#   mode "0755"
#   action :copy
#done
#
#bash 'run go application' do
#  user 'nobody'
#  cwd '/opt/app'
#  code <<-EOH
#  kill `cat server.pid`
#  go run server.go &
#  echo $! > server.pid
#  EOH
#end
