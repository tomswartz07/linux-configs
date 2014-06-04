class accounts
{
  user { "tom" :
    ensure     => present,
    managehome => true,
    home       => '/home/tom',
    password   => 'tom',
    groups     => ['power','video','wheel'],
    shell      => '/bin/zsh',
    require    => Class['zsh'],
  }
}
