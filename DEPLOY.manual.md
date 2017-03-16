# Deployment instructions

Our dev deployment environment is going to be a Ubuntu 14.04 VM with Puppet.

Using the provided Vagrantfile, do a `vagrant up` and then log in with
`vagrant ssh`.

Once in your Vagrant box, run the following to ensure the right tools are
in place:

`sudo apt-get install -y ruby ruby-sinatra ruby-rspec ruby-rack ruby-rack-test`

Start up the service using:

`cd /vagrant; rackup`

The provided Vagrantfile maps the host port `1404` the the Vagrant box's `9292`
(the default port for Rack apps)

Then from the host machine, you should be able to reach the service via:

`curl http://localhost:1404/ping`
`curl http://localhost:1404/cpuinfo`
`curl http://localhost:1404/meminfo`
`curl http://localhost:1404/uptime`
