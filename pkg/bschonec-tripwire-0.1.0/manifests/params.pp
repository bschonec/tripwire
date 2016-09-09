class tripwire::params {

  $bridge_host        = Undef
  $bridge_port        = 5670
  $dns_service_name   = Undef
  $dns_service_domain = Undef


  $conf_file          = '/etc/tripwire/tripwire.conf'
  $service_enable     = true
  $service_ensure     = running
  $service_name       = 'tripwire-axon-agent'

  $package_ensure     = installed

  # Decide what RPM is rquired based on the architecture.
  case $::architecture {

    'i386':    { $package_name = 'axon-agent-installer-linux-x86' }
    'x86_64':  { $package_name = 'axon-agent-installer-linux-x64' }

  }

}
