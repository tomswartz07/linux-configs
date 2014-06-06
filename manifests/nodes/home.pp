# Home Nodes
#
# Defines all nodes used on personal machines.
#
node vega {
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
  }
  class { 'mutt' :}
  class { 'vim' :}
  class { 'pacman' :
    iLoveCandy => true,
  }
}

node davros {
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
  }
  class { 'mutt' :}
  class { 'vim' :}
  class { 'pacman' :
    iLoveCandy => true,
  }
}

node thay {
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
  }
  class { 'mutt' :}
  class { 'vim' :}
  class { 'pacman' :
    iLoveCandy => true,
  }
}

