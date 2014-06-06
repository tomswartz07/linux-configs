#TODO deploy all .vim files from linux-configs
class vim
{
  package { 'gvim' :
    ensure => latest,
  }

  file { 'vimrc file' :
    ensure => present,
    path   => '/home/tom/.vimrc',
    source => 'puppet:///modules/vim/vimrc',
  }

  file { 'vim colorscheme' :
    ensure  => present,
    path    => '/home/tom/.vim/colors/wombat.vim',
    source  => 'puppet:///modules/vim/wombat.vim',
    recurse => inf,
  }
}
