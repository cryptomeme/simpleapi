# This defines the install needs for our 'simplestats' service

package {'ruby':
	ensure => installed,
}

package { 'ruby-sinatra':
	ensure => installed,
}

package { 'ruby-rack':
	ensure => installed,
}

# Not strictly needed for deploy, would be left out of prod
package {'ruby-rspec':
	ensure => installed,
}

package {'ruby-rack-test':
	ensure => installed,
}


# Make a home directory for the service 
file {'/opt/simplestats':
	ensure => link,
	target => '/vagrant',
}

# Make sure the executable bit is there
file {'/opt/simplestats/simplestats.rb':
	ensure => file,
	require => File['/opt/simplestats'],
}


# Install a copy of the Upstart init script in the VM
file { '/etc/init/simplestats.conf':
	ensure => file,
	source => "file:///vagrant/init/simplestats.conf",
}

# Configure the service, matched the service name to the init file we just installed
service {'simplestats':
        ensure => running,
        enable => true,
        provider => 'upstart',
}


# Make sure our config is there before the service, and restart the service
# if it changed
File['/etc/init/simplestats.conf'] ~> Service['simplestats']


Package['ruby-rack'] -> Service['simplestats']
Package['ruby-sinatra'] -> Service['simplestats']