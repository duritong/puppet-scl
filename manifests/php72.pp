# install php 7.2 incl. common libs
class scl::php72 {
  scl::phpx{
    '72':
      #prefix         => 'rh-',
      #more_prefix    => 'more-',
      disabled_libs   => 'php-suhosin',
      additional_libs => [
        'php72-php-snuffleupagus',
        'php72-php-opcache',
      ],
  }
}
