
case $::operatingsystem {
  darwin: {
    class { 'macports':
      prefix           => '/opt/local',
      default_variants => ['+bash_completion', '+python27', '+ruby'];
    }
  }
  default: {}
}
class { 'vim': }
class { 'hg':}
class { 'git':}