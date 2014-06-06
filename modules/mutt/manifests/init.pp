class mutt
{
  package { 'mutt' :
    ensure => latest,
  }
  file { 'muttrc file' :
    ensure => present,
    path   => '/home/tom/.muttrc',
    source => 'puppet:///modules/mutt/.muttrc',
  }
}
