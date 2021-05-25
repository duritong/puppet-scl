# install php 7.3 incl. common libs
class scl::php73 {
  scl::phpx {
    '73':
      disabled_libs   => '^php-(suhosin|mcrypt)$',
      additional_libs => [
        'php73-php-snuffleupagus',
        'php73-php-opcache',
        'php73-php-pecl-zip',
      ],
  }
}
