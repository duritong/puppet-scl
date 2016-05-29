# install php 5.5 incl. common libs
class scl::php55 {
  scl::phpx{
    '55':
      additional_libs => [ 'php55-php-pecl-gnupg',
        'php55-php-pecl-protocolbuffers', 'php55-php-pecl-quickhash',
        'php55-php-opcache',],
  }
}
