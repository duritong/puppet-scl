# install php 7.4 incl. common libs
class scl::php74 {
  scl::phpx {
    '74':
      disabled_libs   => '^php-(suhosin|mcrypt|recode)$',
      additional_libs => [
        'php74-php-snuffleupagus',
        'php74-php-opcache',
        'php74-php-pecl-zip',
        'php74-php-sodium',
      ],
  }
}
