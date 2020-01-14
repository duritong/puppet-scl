# install php 7.4 incl. common libs
class scl::php74 {
  scl::phpx{
    '74':
      #prefix         => 'rh-',
      #more_prefix    => 'more-',
      disabled_libs   => '^php-(suhosin|mcrypt)$',
      additional_libs => [
        'php74-php-snuffleupagus',
        'php74-php-opcache',
        'php74-php-pecl-zip',
      ],
  }
}
