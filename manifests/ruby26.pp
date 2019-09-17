# install ruby 2.6 incl. bundler
class scl::ruby26 {
  require ::scl

  package{
    [ 'rh-ruby26-ruby-devel',
      'rh-ruby26-rubygem-bundler' ]:
        ensure => present;
  }
}
