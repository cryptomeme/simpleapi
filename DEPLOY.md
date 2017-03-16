# Deployment Overview

Our dev deployment environment is going to be a Ubuntu 14.04 VM with Puppet.


# Deployment instructions for Vagrant Shell provisioner

Using the provided Vagrantfile, do a `vagrant destroy` to make sure you are starting
clean.  Then run a `vagrant up --provision-with shell` and the script located at 
`install-api-env.sh` will be executed with `sudo` privileges, installing the necessary packages, and starting up the service.


# Testing the deployment

The provided Vagrantfile maps the host port `1404` the the Vagrant box's `9292`
(the default port for Rack apps)

Then from the host machine, you should be able to reach the service via:

`curl http://localhost:1404/ping`
`curl http://localhost:1404/cpuinfo`
`curl http://localhost:1404/meminfo`
`curl http://localhost:1404/uptime`


This is also reachable from the host's external IP, e.g. if your host machine is
assigned `192.168.1.217` then the following `curl` commands will work:

`curl http://192.168.1.217:1404/ping`
`curl http://192.168.1.217:1404/cpuinfo`
`curl http://192.168.1.217:1404/meminfo`
`curl http://192.168.1.217:1404/uptime`