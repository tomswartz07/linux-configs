node default {
  stage { 'first' : before => Stage['main']}
  class { 'i3' :}
  class { 'mutt' :}
  class { 'zsh' :
    stage => 'first',
  }
  class { 'vim' :}
  class { 'accounts' :
    stage => 'first',
  }
  class { 'pacman' :
    iLoveCandy => true,
  }
}

node heimdall {
  stage { 'first' : before => Stage['main']}
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
  class { 'zsh' :
    stage => 'first',
  }
  class { 'vim' :}
  class { 'accounts' :
    stage => 'first',
  }
  class { 'pacman' :
    iLoveCandy => true,
  }
}
