# Class: logio::harvester
#
# This module manages log.io harvester
#
# Parameters:
#   host: server host. defaults to 127.0.0.1
#   port: server port. defaults to 8998
#   instance_name: harvester name defaults to fqdn
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   include logio::harvester
#
# [Remember: No empty lines between comments and class definition]
class logio::harvester(
  host          = '127.0.0.1',
  port          = 8998,
  instance_name = $fqdn,
) {

  include logio::package

  file { '/etc/log.io/harvester.conf':
    content => template('logio/harvester.conf.erb'),
    mode    => '0644',
    owner   => root,
    group   => 0,
    notify  => Exec['log.io harvester start'],
    require => Class['logio::package'],
  }

  exec { 'log.io harvester start':
    path => ['/bin', '/usr/bin', '/usr/local/bin'],
  }
}
