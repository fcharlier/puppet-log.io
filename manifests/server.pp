# Class: logio::server
#
# This module manages log.io server
#
# Parameters:
#   port: server port. defaults to 8998
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   include logio::server
#
# [Remember: No empty lines between comments and class definition]
class logio::server(
  $port = 8998,
) {

  include logio::package

  file { '/etc/log.io/server.conf':
    content => template('logio/server.conf.erb'),
    mode    => '0644',
    owner   => root,
    group   => 0,
    notify  => Exec['log.io server start'],
    require => Class['logio::package'],
  }

  exec { 'log.io server start':
    path => ['/bin', '/usr/bin', '/usr/local/bin'],
  }
}
