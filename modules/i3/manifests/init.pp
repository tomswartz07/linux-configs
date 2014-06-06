# == Class: i3
#
# Installs and configures i3 Window Manager.
#
# Allows for input of i3status values, such as battery and network
# devices. Variable hardware, such as wireless cards, can be hidden.
#
# === Parameters
#
# [*disableDHCP*]
#   Disables the display of the DHCP process checker on the i3status
#   bar. If false, DHCP will appear in the bar. If true, it will not.
#
# [*disableWireless*]
#   Disables the display of the WiFi IP address on the i3status
#   bar. If false, wireless info will appear in the bar. If true, it will not.
#
# [*disableBattery*]
#   Disables the display of the battery information on the i3status
#   bar. If false, battery info will appear in the bar. If true, it will not.
#
# [*wlan*]
#   Defines the WLAN address. Usually wlan0 or wlp#s#.
#   Will not be used if `disableWireless` is set to True.
#
# [*eth*]
#   Defines the ETH address. Usually eth0 or enp#s#.
#   Will not be used if `disableEthernet` is set to True.
#
# [*battery*]
#   Defines the number of the battery.
#   Typically is '0' but some devices list main battery as '1'
#
# [*tempDevice*]
#   Defines the path to the thermal sensor.
#   Typically is listed in /sys/class/devices/
#
# === Examples
#
#  class { i3:
#    disableDHCP => true,
#    wlan        => wlp2s0,
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
class i3 (
  $disableDHCP = false,
  $disableWireless = false,
  $disableEthernet = false,
  $disableBattery = false,
  $wlan = 'wlp2s0',
  $eth = 'eth0',
  $battery = '0',
  $tempDevice = 'empty',
)
{
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

    file { 'i3 status' :
      path    => '/home/tom/.i3status.conf',
      content => template("${module_name}/.i3status.conf.erb"),
    }

    file { 'i3 config' :
      path    => '/home/tom/.i3/config',
      source  => "puppet:///modules/${module_name}/config",
      recurse => true,
    }
  }
}

