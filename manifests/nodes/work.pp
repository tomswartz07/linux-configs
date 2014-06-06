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
  }
  class { 'mutt' :}
  class { 'vim' :}
  class { 'pacman' :
    iLoveCandy => true,
  }
}
