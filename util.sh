
function get_local_ip () {
   SERVER=$1
   if [ -z $SERVER ]; then return 1; fi
   vagrant ssh $SERVER -c 'inet=`ip addr show dev eth0 | grep "inet "`; echo -n ${inet%%/*} | tr -d "inet " ' 2>/dev/null
}


# cookbooks/nginx/files/default/hosts
function update_hosts_in_cookbook() { 
  SERVER=$1
  IP=$2
  echo
  echo "hostsfile_entry '$IP' do"
  echo "  hostname  '$SERVER'"
  echo "  unique    true"
  echo "end"
  echo
}


