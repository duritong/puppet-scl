# install ruby 2.3 incl. bundler
class scl::ruby23 {
  require ::scl

  package{
    [ 'rh-ruby23-ruby-devel',
      'rh-ruby23-rubygem-bundler' ]:
        ensure => present;
  }
}
