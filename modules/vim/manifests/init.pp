class vim {
    case $operatingsystem {
        fedora, centos, scientific: {
            package { 'vim-enhanced':
                ensure => installed,
            }
        }
        darwin: {
            package { ['vim', 'MacVim']:
                ensure => installed,
                provider => darwinport,
            }
        }
        default: { fail("Unrecognized operating system: $operatinsystem") }
    }
}