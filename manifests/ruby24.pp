# install ruby 2.4 incl. bundler
class scl::ruby24 {
  require scl

  package {
    ['rh-ruby24-ruby-devel',
    'rh-ruby24-rubygem-bundler']:
      ensure => present;
  }
}
