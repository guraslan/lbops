#!/usr/bin/env bash
hostname=$1
hostnamectl set-hostname $hostname
curl -L https://www.opscode.com/chef/install.sh | bash
