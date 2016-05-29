# install php 5.4 incl. common libs
class scl::php54 {
  scl::phpx{
    '54':
      additional_libs => [ 'php54-php-pecl-gnupg',
        'php54-php-pecl-protocolbuffers', 'php54-php-pecl-quickhash', ],
  }
}
