# == Class: i3
#
# Installs and configures i3 Window Manager
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#  class { i3:
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
class i3 {
  case $::operatingsystem {
    Archlinux : {
      $supported = true
      $pkg_name = 'i3'
    }
    default : {
      $supported = false
    }
  }
  if ($supported == true) {
    package { $pkg_name :
      ensure => installed,
    }

    file { 'i3 status' : #TODO Add Facter support to autofill fields
      path    => '/home/tom/.i3status.conf',
      content => template("${module_name}/.i3status.conf.erb"),
    }

    file { 'i3 config' :
      path    => '/home/tom/.i3/config',
      recurse => true,
      source  => "puppet:///modules/${module_name}/config",
    }
  }
}

