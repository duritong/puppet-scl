# install php 5.6 incl. common libs
class scl::php56 {
  scl::phpx{
    '56':
      prefix          => 'rh-',
      more_prefix     => 'more-',
      additional_libs => [ 'rh-php56-php-opcache',],
  }
}
