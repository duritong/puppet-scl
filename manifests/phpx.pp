# this is a wrapper class
# that should help you getting
# all the necessary php scls for a particular
# version including some usefull libs
# we try to have common set of libs and include
# additional libs with the additional libs
# param. This define will automatically prefix them.
define scl::phpx(
  $prefix          = '',
  $more_prefix     = '',
  $additional_libs = [],
) {
  require ::scl
  $repo_name = "remi-php${name}more-epel-${::operatingsystemmajrelease}-x86_64"
  yum::repo{
    $repo_name:
      descr    => "Php${name}more - epel-${::operatingsystemmajrelease}-x86_64",
      baseurl  => "https://www.softwarecollections.org/repos/remi/php${name}more/epel-${::operatingsystemmajrelease}-x86_64",
      gpgkey   => "https://copr-be.cloud.fedoraproject.org/results/remi/php${name}more/pubkey.gpg",
      enabled  => 1,
      gpgcheck => 1,
  }
  ensure_packages(prefix(
    [ 'php-bcmath',
      'php-cli',
      'php-common',
      'php-dba',
      'php-devel',
      'php-enchant',
      'php-gd',
      'php-intl',
      'php-mbstring',
      'php-mysqlnd',
      'php-odbc',
      'php-pdo',
      'php-pear',
      'php-pecl-memcache',
      'php-pgsql',
      'php-process',
      'php-recode',
      'php-soap',
      'php-xml',
      'php-xmlrpc',
    ],"${prefix}php${name}-"
  ))
  ensure_packages(prefix(
    [ 'php-imap',
      'php-mcrypt',
      'php-pecl-apcu',
      'php-pecl-crypto',
      'php-pecl-geoip',
      'php-pecl-http',
      'php-pecl-imagick',
      'php-pecl-lzf',
      'php-pecl-mailparse',
      'php-pecl-memcached',
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
      'php-suhosin',
      'php-tidy',
    ],"${more_prefix}php${name}-"
  ),{require   => Yum::Repo[$repo_name]})
  ensure_packages($additional_libs,{require => Yum::Repo[$repo_name]})
  if versioncmp($::operatingsystemmajrelease,'7') < 0 {
    ensure_packages(prefix(['php-pecl-sqlite',],"${prefix}php${name}-"))
  }
}
