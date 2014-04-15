class vim
{
  package { 'vim' :
    ensure => latest,
  }

  file { '/home/tom/.vimrc' :
    ensure => present,
    source => 'puppet:///modules/vim/.vimrc'
  }

  file { '/home/tom/.vim' :
    ensure => directory,
  }

  file { '/home/tom/.vim/colors' :
    ensure  => directory,
    require => File['/home/tom/.vim'],
  }
  ->
  file { '/home/tom/.vim/colors/wombat.vim' :
    ensure  => present,
    source  => 'puppet:///modules/vim/wombat.vim',
    require => File['/home/tom/.vim/colors'],
  }
}
