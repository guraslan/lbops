#!/usr/bin/env bash

set -e error
set -e pipe

cd code
sh build.sh
cd ..

vagrant rsync tapp1
vagrant rsync tapp2

vagrant ssh tapp1 -c "sudo chef-solo --config /vagrant/solo.rb --json-attributes /vagrant/app_chef_solo.json  --log_level info --force-formatter"

vagrant ssh tapp2 -c "sudo chef-solo --config /vagrant/solo.rb --json-attributes /vagrant/app_chef_solo.json  --log_level info --force-formatter"


# Get public ip for tlb
public_dns=`vagrant ssh-config tlb | grep HostName | awk '{print $2}'`

echo
echo
echo "Proof of concept run for round-robin"
echo "10 consecutive answers from tlb (${public_dns})"
for i in $(seq 1 10); do
   curl http://${public_dns}
   echo
done
