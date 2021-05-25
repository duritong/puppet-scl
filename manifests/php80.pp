# install php 8.0 incl. common libs
class scl::php80 {
  scl::phpx {
    '80': # https://blog.remirepo.net/post/2020/09/21/PHP-extensions-status-with-upcoming-PHP-8.0
      disabled_libs   => '^php-(suhosin|mcrypt|recode|pecl-propro|pecl-uploadprogress|recode|xmlrpc)$',
      additional_libs => [
        'php80-php-snuffleupagus',
        'php80-php-opcache',
        'php80-php-pecl-zip',
        'php80-php-sodium',
      ],
  }
}
