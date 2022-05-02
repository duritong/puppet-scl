require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php81', :type => 'class' do
  let(:pre_condition){ 'include yum::prerequisites
                       Exec{ path => "/usr" }' }
  describe 'with standard on el7' do
    let(:facts){
      {
        :operatingsystemmajrelease => '7',
        :os => {
          :release => {
            :major => '7',
          }
        },
      }
    }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('scl') }

    [ 'php81-php-common',
      'php81-php-bcmath',
      'php81-php-cli',
      'php81-php-dba',
      'php81-php-devel',
      'php81-php-enchant',
      'php81-php-gd',
      'php81-php-imap',
      'php81-php-intl',
      'php81-php-mbstring',
      'php81-php-mysqlnd',
      'php81-php-odbc',
      'php81-php-pdo',
      'php81-php-pear',
      'php81-php-pecl-memcache',
      'php81-php-pgsql',
      'php81-php-process',
      'php81-php-soap',
      'php81-php-tidy',
      'php81-php-xml',
      'php81-php-snuffleupagus',
      'php81-php-opcache', ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'installed',
      )}
    end
    [ 'php81-php-recode',
      'php81-php-pecl-sqlite',
      'php81-php-xmlrpc', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end

end
