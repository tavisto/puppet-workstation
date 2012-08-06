class git {
    case $::operatingsystem {
        fedora, centos, scientific: {
            package { 'git':
                ensure => installed,
            }
        }
        debian, ubuntu: {
            package { 'git-core':
                  ensure   => installed
            }
        }
        darwin: {
            package { 'git-core':
                  ensure   => installed,
                  provider => 'macports',
            }
        }
        default: { fail("Unrecognized operating system: ${::operatinsystem}") }
    }
}