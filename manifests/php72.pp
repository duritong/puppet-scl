# install php 7.2 incl. common libs
class scl::php72 {
  scl::phpx{
    '72':
      disabled_libs   => '^php-(suhosin|mcrypt)$',
      additional_libs => [
        'php72-php-snuffleupagus',
        'php72-php-opcache',
        'php72-php-pecl-zip',
      ],
  }
}
