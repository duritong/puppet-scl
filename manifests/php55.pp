# install php 5.5 incl. common libs
class scl::php55 {
  require ::scl

  # we need some more extensions
  $repo_name = "remi-php55more-epel-${::operatingsystemmajrelease}-x86_64"
  yum::repo{
    $repo_name:
      descr    => "Php54more - epel-${::operatingsystemmajrelease}-x86_64",
      baseurl  => "https://www.softwarecollections.org/repos/remi/php55more/epel-${::operatingsystemmajrelease}-x86_64",
      gpgkey   => 'https://copr-be.cloud.fedoraproject.org/results/remi/php55more/pubkey.gpg',
      enabled  => 1,
      gpgcheck => 1,
  } -> package{$repo_name:
    ensure => present;
  } -> package{
    [ 'php55-php-common',
      'php55-php-bcmath',
      'php55-php-cli',
      'php55-php-dba',
      'php55-php-devel',
      'php55-php-enchant',
      'php55-php-gd',
      'php55-php-imap',
      'php55-php-intl',
      'php55-php-mbstring',
      'php55-php-mcrypt',
      'php55-php-mysqlnd',
      'php55-php-odbc',
      'php55-php-pdo',
      'php55-php-pear',
      'php55-php-pecl-apcu',
      'php55-php-pecl-crypto',
      'php55-php-pecl-geoip',
      'php55-php-pecl-gnupg',
      'php55-php-pecl-http',
      'php55-php-pecl-imagick',
      'php55-php-pecl-lzf',
      'php55-php-pecl-mailparse',
      'php55-php-pecl-memcache',
      'php55-php-pecl-memcached',
      'php55-php-pecl-msgpack',
      'php55-php-pecl-oauth',
      'php55-php-pecl-protocolbuffers',
      'php55-php-pecl-quickhash',
      'php55-php-pecl-scrypt',
      'php55-php-pecl-selinux',
      'php55-php-pecl-sqlite',
      'php55-php-pecl-ssh2',
      'php55-php-pecl-uploadprogress',
      'php55-php-pecl-uuid',
      'php55-php-pecl-yaml',
      'php55-php-pgsql',
      'php55-php-process',
      'php55-php-recode',
      'php55-php-suhosin',
      'php55-php-soap',
      'php55-php-tidy',
      'php55-php-xml',
      'php55-php-xmlrpc',
      'php55-php-opcache',]:
        ensure => present;
      'php55-php-xcache':
        ensure => absent;
  }
}
