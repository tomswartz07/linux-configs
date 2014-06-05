class vim
{
  package { 'gvim' :
    ensure => latest,
  }

  file { '/home/tom/.vimrc' :
    ensure => present,
    source => 'puppet:///modules/vim/vimrc'
  }

  file { 'vim colorscheme' :
    ensure  => present,
    path    => '/home/tom/.vim/colors/wombat.vim',
    source  => 'puppet:///modules/vim/wombat.vim',
    recurse => inf,
  }
  #TODO deploy all .vim files from linux-configs
}
