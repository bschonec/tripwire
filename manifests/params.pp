class tripwire::params {

  $bridge_host        = Undef
  $bridge_port        = 5670
  $dns_service_name   = Undef
  $dns_service_domain = Undef


  $conf_file          = '/etc/tripwire/twagent.conf'
  $service_enable     = true
  $service_ensure     = running
  $service_name       = 'tripwire-axon-agent'

  $package_ensure     = installed

  $package_name = 'axon-agent'

}
