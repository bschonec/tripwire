# == Class: tripwire
#
# Full description of class tripwire here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'tripwire':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class tripwire (
  $package_name   = $::tripwire::params::package_name,
  $service_ensure = $::tripwire::params::service_ensure,
  $service_name   = $::tripwire::params::service_name,
  $service_enable = $::tripwire::params::service_enable,
 

  $bridge_host        = $::tripwire::params::bridge_host,
  $bridge_port        = $::tripwire::params::bridge_port,
  $dns_service_name   = $::tripwire::params::dns_service_name,
  $dns_service_domain = $::tripwire::params::dns_service_domain,

  $conf_file          = $::tripwire::params::conf_file,
) inherits ::tripwire::params

{

  package { $package_name:
    ensure => $package_ensure,
  }

  service { $service_name:
    enable => $service_enable,
    ensure  => $service_ensure,
    require => Package[$package_name],
  }

  file { $conf_file:
    ensure  => present,
    notify  => Service[$service_name],
    require => Package[$package_name],
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('tripwire/twagent.conf.erb'),
  }
}
