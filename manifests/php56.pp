# install php 5.6 incl. common libs
class scl::php56 {
  scl::phpx{
    '56':
      additional_libs => [ 'php56-php-opcache',],
      disabled_libs   => '(imagick)$',
  }
}
