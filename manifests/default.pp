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
