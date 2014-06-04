# == Class: pacman
#
# Configures PacMan package manager for ArchLinux.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*iLoveCandy*]
#   Inserts 'easter egg' configuration option into pacman.conf
#   Changes the standard [###--] progress bar with [---C o o ]
#   styled after the 1980's 'Pacman' game.
#
# === Examples
#
#  class { pacman:
#    iLoveCandy => true,
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
class pacman (
  $iLoveCandy = false,
){
  case $::operatingsystem {
    Archlinux : {
      $supported = true
    }
    default : {
      $supported = false
    }
  }

  exec { 'pacman-update' :
    command     => '/usr/bin/pacman -Syy',
    subscribe   => File['pacman.conf'],
    refreshonly => true,
  }

  if ($supported == true) {
    file { 'pacman.conf' :
      path    => '/etc/pacman.conf',
      content => template("${module_name}/pacman.conf.erb"),
      notify  => Exec['pacman-update'],
      owner   => '0',
      group   => '0',
    }
  }
}
