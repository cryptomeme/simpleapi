#!/bin/sh

apt-get install -y ruby ruby-sinatra ruby-rspec ruby-rack ruby-rack-test

cd /vagrant

rackup -D