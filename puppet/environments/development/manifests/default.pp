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
