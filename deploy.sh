#!/usr/bin/env bash

source util.sh

set -e error
set -e pipe

echo "Fire up machines using vagrant"
vagrant up --provider=aws

echo "Getting local ip addresses"
TLB=`get_local_ip tlb`
TAPP1=`get_local_ip tapp1`
TAPP2=`get_local_ip tapp2`


echo "Generating hosts recipe from local addresses"
# Generate hosts recipe
{
  update_hosts_in_cookbook tlb $TLB 
  update_hosts_in_cookbook tapp1 $TAPP1 
  update_hosts_in_cookbook tapp2 $TAPP2 
} > cookbooks/nginx/recipes/hosts.rb

echo "Updated: cookbooks/nginx/recipes/hosts.rb"


vagrant rsync tlb

vagrant ssh tlb -c "sudo chef-solo --config /vagrant/solo.rb --json-attributes /vagrant/lb_chef_solo.json  --log_level info --force-formatter"

sh deploy_code.sh


