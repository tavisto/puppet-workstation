
case $::operatingsystem {
  darwin: {
    class { 'macports':
      prefix           => '/opt/local',
      default_variants => ['+bash_completion', '+python27', '+ruby'];
    }
  }
  default: {}
}
include vim
include hg
include git
include python
include utils