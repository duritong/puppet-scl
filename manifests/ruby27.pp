# install ruby 2.7 incl. bundler
class scl::ruby27 {
  require scl

  package{
    [ 'rh-ruby27-ruby-devel',
      'rh-ruby27-rubygem-bundler' ]:
        ensure => present;
  }
}
