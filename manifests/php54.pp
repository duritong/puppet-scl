# install ruby 54 incl. common libs
class scl::php54 {
  require ::scl

  # we need some mor extensions
  yum::repo{
    'remi-php54more-epel-6-x86_64':
      descr    => 'Php54more - epel-6-x86_64',
      baseurl  => 'https://www.softwarecollections.org/repos/remi/php54more/epel-6-x86_64',
      enabled  => 1,
      gpgcheck => 0,
  } -> package{
    [ 'php54-php-pecl-propro',
      'php54-php-pecl-raphf', ]:
    ensure => present;
  } -> package{
    [ 'php54-php-common',
      'php54-php-bcmath',
      'php54-php-cli',
      'php54-php-dba',
      'php54-php-devel',
      'php54-php-enchant',
      'php54-php-gd',
      'php54-php-imap',
      'php54-php-intl',
      'php54-php-mbstring',
      'php54-php-mcrypt',
      'php54-php-mysqlnd',
      'php54-php-odbc',
      'php54-php-pdo',
      'php54-php-pear',
      'php54-php-pecl-apc',
      'php54-php-pecl-crypto',
      'php54-php-pecl-geoip',
      'php54-php-pecl-gnupg',
      'php54-php-pecl-http',
      'php54-php-pecl-imagick',
      'php54-php-pecl-lzf',
      'php54-php-pecl-mailparse',
      'php54-php-pecl-memcache',
      'php54-php-pecl-memcached',
      'php54-php-pecl-msgpack',
      'php54-php-pecl-oauth',
      'php54-php-pecl-protocolbuffers',
      'php54-php-pecl-quickhash',
      'php54-php-pecl-scrypt',
      'php54-php-pecl-selinux',
      'php54-php-pecl-sqlite',
      'php54-php-pecl-ssh2',
      'php54-php-pecl-uploadprogress',
      'php54-php-pecl-uuid',
      'php54-php-pecl-yaml',
      'php54-php-pgsql',
      'php54-php-process',
      'php54-php-recode',
      'php54-php-suhosin',
      'php54-php-soap',
      'php54-php-tidy',
      'php54-php-xml',
      'php54-php-xmlrpc', ]:
        ensure => present;
  }
}
