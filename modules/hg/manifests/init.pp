class hg {
    case $operatingsystem {
        fedora, centos, scientific: {
            package { 'mercurial':
                ensure => installed,
            }
        }
        darwin: {
            package { 'mercurial':
                ensure => installed,
                provider => darwinport,
            }
        }
        default: { fail("Unrecognized operating system: $operatinsystem") }
    }
}