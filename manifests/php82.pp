# install php 8.2 incl. common libs
class scl::php82 {
  scl::phpx {
    '82':
      disabled_libs   => '^php-(suhosin|mcrypt|recode|pecl-propro|pecl-uploadprogress|recode|xmlrpc)$',
      additional_libs => [
        'php82-php-snuffleupagus',
        'php82-php-opcache',
        'php82-php-pecl-zip',
        'php82-php-sodium',
      ],
  }
}
