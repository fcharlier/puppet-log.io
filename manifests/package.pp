# Class: logio::packages
#
# This module manages log.io packages
#
# Parameters:
#
# Actions:
#
# Requires:
#   nodejs installed, npm provider
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class logio::package {
  package { ['log.io', 'forever']:
    ensure   => installed,
    provider => npm,
    require  => [Class['nodejs'], User['logio']],
  }

  group { 'logio':
    ensure => present,
    system => true
  }
  user { 'logio':
    ensure     => present,
    system     => true,
    gid        => 'logio',
    groups     => 'adm',
    home       => '/home/logio',
    managehome => true,
    require    => Group['logio'],
  }
}
