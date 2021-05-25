# install ruby 2.5 incl. bundler
class scl::ruby25 {
  require scl

  package {
    ['rh-ruby25-ruby-devel',
    'rh-ruby25-rubygem-bundler']:
      ensure => present;
  }
}
