# Class: vim
#
# Installs vim and all the things needed to run syntastic checks
#
# Sample Usage:
# include vim
class vim {
  case $::operatingsystem {
    fedora, centos, scientific: {
      package { ['vim-enhanced', 'ctags-etags'] :
        ensure => installed,
      }
    }
    darwin: {
      package { ['vim', 'MacVim']:
        ensure   => installed,
        provider => 'macports',
        }
      # For Syntastic Checks
      package { [
        'ctags',
        'npm',
        'rb-rubygems',
        'py27-pylint',
        'tidy',
        'pear-PHP_CodeSniffer',
        ]:
        ensure   => installed,
        provider => 'macports',
        }
    }
    default: { fail("Unrecognized operating system: ${::operatinsystem}") }
  }
}