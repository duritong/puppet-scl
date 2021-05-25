# install ruby 193 incl. bundler
class scl::ruby193 {
  require scl

  package {
    ['ruby193-ruby-devel',
    'ruby193-rubygem-bundler']:
      ensure => present;
  }
}
