class vim {
  case $::operatingsystem {
    fedora, centos, scientific: {
      package { 'vim-enhanced':
        ensure => installed,
      }
    }
    darwin: {
      package { ['vim', 'MacVim']:
        ensure   => installed,
        provider => 'macports',
        }
      # For Syntastic Checks
      package { ['npm', 'rb-rubygems', 'py27-pylint', 'tidy']:
        ensure   => installed,
        provider => 'macports',
        }
    }
    default: { fail("Unrecognized operating system: ${::operatinsystem}") }
  }
}