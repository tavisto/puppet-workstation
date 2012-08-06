class git {
    case $::operatingsystem {
        fedora, centos, scientific: {
            package { 'git':
                ensure => installed,
            }
        }
        debian, ubuntu, darwin: {
            package { 'git-core':
                  ensure   => installed
            }
        }
        default: { fail("Unrecognized operating system: ${::operatinsystem}") }
    }
}