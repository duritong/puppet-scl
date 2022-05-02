# install php 8.1 incl. common libs
class scl::php81 {
  scl::phpx {
    '81':
      disabled_libs   => '^php-(suhosin|mcrypt|recode|pecl-propro|pecl-uploadprogress|recode|xmlrpc)$',
      additional_libs => [
        'php81-php-snuffleupagus',
        'php81-php-opcache',
        'php81-php-pecl-zip',
        'php81-php-sodium',
      ],
  }
}
