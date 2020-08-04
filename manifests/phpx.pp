# this is a wrapper class
# that should help you getting
# all the necessary php scls for a particular
# version including some usefull libs
# we try to have common set of libs and include
# additional libs with the additional libs
# param. This define will automatically prefix them.
define scl::phpx(
  $prefix          = '',
  $additional_libs = [],
  $disabled_libs   = 'donotreject',
) {
  require ::scl
  require yum::centos::remi
  ensure_packages(prefix(reject(
    [ 'php-bcmath',
      'php-cli',
      'php-common',
      'php-dba',
      'php-devel',
      'php-enchant',
      'php-fpm',
      'php-gd',
      'php-gmp',
      'php-imap',
      'php-intl',
      'php-mbstring',
      'php-mcrypt',
      'php-mysqlnd',
      'php-odbc',
      'php-pdo',
      'php-pear',
      'php-pecl-apcu',
      'php-pecl-crypto',
      'php-pecl-geoip',
      'php-pecl-http',
      'php-pecl-imagick',
      'php-pecl-lzf',
      'php-pecl-mailparse',
      'php-pecl-memcached',
      'php-pecl-memcache',
      'php-pecl-msgpack',
      'php-pecl-oauth',
      'php-pecl-propro',
      'php-pecl-raphf',
      'php-pecl-scrypt',
      'php-pecl-selinux',
      'php-pecl-ssh2',
      'php-pecl-uploadprogress',
      'php-pecl-uuid',
      'php-pecl-yaml',
      'php-pgsql',
      'php-process',
      'php-recode',
      'php-soap',
      'php-suhosin',
      'php-tidy',
      'php-xml',
      'php-xmlrpc',
    ],$disabled_libs),"${prefix}php${name}-"
  ))
  ensure_packages($additional_libs,{require => Yum::Repo['remi-safe']})
}
