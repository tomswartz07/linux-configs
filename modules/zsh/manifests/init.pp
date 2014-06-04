# == Class: zsh
#
# Installs and configures zsh
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#  class { zsh:
#  }
#
# === Authors
#
# Tom Swartz <tom@tswartz.net>
#
# === Copyright
#
# Copyright 2014
#
class zsh {
  package { 'zsh' :
    ensure => latest,
  }
  file { 'zshrc' :
    ensure  => present,
    path    => '/home/tom/.zshrc',
    source  => 'puppet:///modules/zsh/.zshrc',
  }
}
