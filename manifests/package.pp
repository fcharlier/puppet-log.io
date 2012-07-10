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
    require  => Class['nodejs'],
  }
}
