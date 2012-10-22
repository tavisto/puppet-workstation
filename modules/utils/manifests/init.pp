# Class: utils
#
# Installs basic utls
#
# Sample Usage:
# include utils
class utils {
  case $::operatingsystem {
    fedora, centos, scientific: {
      package { [
        'bash-completion',
        'watch',
        'htop',
        'tree',
      ]:
        ensure => installed,
      }
    }
    darwin: {
      # Usefull utilitys that are a must have
      package { [
        'wget',
        'watch',
        'htop',
        'tree',
        'pwgen',
        'autossh',
        'bash-completion',
        ]:
        ensure   => installed,
        provider => 'macports',
        }
    }
    default: { fail("Unrecognized operating system: ${::operatingsystem}") }
  }
}