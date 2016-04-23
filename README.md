
# Simple Go application deployment
  with round-round nginx
  in front of 2 application server

```
                  +------+
+-----+      +----| app1 |
|Nginx|------|    +------+
+-----+      |    +------+
             +----| app2 |
                  +------+
```
- Uses vagrant to fire up 2 x App and 1 x NGINX loadbalancer server
- Vagrant provisions chef-solo to all servers
- chef-solo applies runbooks



## Prerequisites:
- AWS EC2 access_key/secret_key with necessary permissions
- vagrant and vagrant-aws plugin
- private key to access AWS EC2 instances
- AWS EC2 security group
    - ingress access to TCP 8484 for traffic between  nginx and appservers
    - ingress access to HTTP to your ip
    - ingress access to SSH to your ip

## Instructions:

- Clone the repository
  
  `$ git clone https://github.com/guraslan/lbops.git`

- Install vagrant-aws plugin
  
  `$ vagrant plugin install vagrant-aws`

- Do necessary changes in aws.json and/or Vagrantfile
  
  `$ cp aws.json.dist aws.json`

- Enter your pem file path in Vagrantfile
  
  `$ cp Vagrantfile.dist Vagrantfile`

- run deploy.sh
  
  `$ sh deploy.sh`



## For code changes only:

- run deploy_code.sh

  `$ sh deploy_code.sh`


