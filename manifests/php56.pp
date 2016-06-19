# install php 5.6 incl. common libs
class scl::php56 {
  $disabled_libs = $::operatingsystemmajrelease ? {
    '6'         => '(imap|tidy|sqlite)$',
    default     => 'donotreject',
  }
  scl::phpx{
    '56':
      prefix          => 'rh-',
      more_prefix     => 'more-',
      additional_libs => [ 'rh-php56-php-opcache',],
      disabled_libs   => $disabled_libs,
  }
}
