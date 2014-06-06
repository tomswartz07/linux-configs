# Work Nodes
#
# Defines all nodes used at work.
#
node heimdall {
  stage { 'first' : before => Stage['main']}
  class { 'zsh' :
    stage => 'first',
  }
  class { 'accounts' :
    stage => 'first',
  }
  class { 'i3' :
    disableDHCP     => true,
    disableWireless => false,
    disableEthernet => true,
    disableBattery  => false,
    wlan            => 'wlp2s0',
    eth             => 'eth0',
    battery         => '0',
    tempDevice      => '/sys/devices/platform/coretemp.0/temp1_input',
  }
  class { 'vim' :}
  class { 'pacman' :
    iLoveCandy => true,
  }
}

node magrathea {
  stage { 'first' : before => Stage['main']}
  class { 'zsh' :
    stage => 'first',
  }
  class { 'accounts' :
    stage => 'first',
  }
  class { 'i3' :
    disableDHCP     => false,
    disableWireless => true,
    disableEthernet => false,
    disableBattery  => true,
    wlan            => 'wlp2s0',
    eth             => 'enp2s0',
    battery         => '0',
    tempDevice      => '/sys/module/k10temp/drivers/pci:k10temp/0000:00:18.3/temp1_input',
  }
  class { 'vim' :}
  class { 'pacman' :
    iLoveCandy => true,
  }
}
