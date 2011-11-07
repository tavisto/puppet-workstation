class git {
    case $operatingsystem {
        fedora, centos, scientific: {
            package { 'git':
                ensure => installed,
            }
        }
        darwin: {
            package { 'git-core':
                ensure => installed,
                provider => darwinport,
            }
        }
        default: { fail("Unrecognized operating system: $operatinsystem") }
    }
}