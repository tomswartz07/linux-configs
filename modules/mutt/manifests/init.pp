class mutt
{
  package { 'mutt' :
    ensure => latest,
  }
  file { '/home/tom/.muttrc' :
    ensure  => present,
    source  => 'puppet:///modules/mutt/.muttrc',
  }
}
