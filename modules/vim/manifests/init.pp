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
            }
        }
        default: { fail("Unrecognized operating system: $operatinsystem") }
    }
}