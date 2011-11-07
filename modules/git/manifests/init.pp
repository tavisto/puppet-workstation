class git {
    case $operatingsystem {
        fedora, centos, scientific: {
            package { 'git':
                ensure => installed,
            }
        }
        darwin: {
            package { 'git':
                ensure => installed,
            }
        }
        default: { fail("Unrecognized operating system: $operatinsystem") }
    }
}