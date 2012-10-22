# Class: python
#
# Installs python and all the usefull packages
#
# Sample Usage:
# include python
class python {

  case $::operatingsystem {
    darwin: {
      # Install all python libs via macports
      package { [
        'py27-pylint',
        'py27-pip',
        'py27-pep8',
        'py27-ipython',
        'py27-nose',
        'py27-pyflakes','pyflakes_select'
      ]:
        ensure   => installed,
        provider => 'macports',
      }
      package { [
        'flake8',
      ]:
        ensure   => installed,
        provider => 'pip',
      }

      file{
        '/opt/local/bin/pip':
          ensure  => link,
          target  => '/opt/local/bin/pip-2.7',
          require => Package['py27-pip'];
        '/opt/local/bin/flake8':
          ensure  => link,
          target  => '/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/flake8',
          require => Package['flake8'];
      }
    }
    default: { fail("Unrecognized operating system: ${::operatingsystem}") }
  }
}
