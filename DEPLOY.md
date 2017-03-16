# Deployment instructions

Our dev deployment environment is going to be a Ubuntu 14.04 VM with Puppet.

Using the provided Vagrantfile, do a `vagrant up` and then log in with
`vagrant ssh`.

Once in your Vagrant box, run the following to ensure the right tools are
in place:

`sudo apt-get install -y ruby ruby-sinatra ruby-rspec ruby-rack ruby-rack-test`