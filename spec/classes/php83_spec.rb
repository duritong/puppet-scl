require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php82', :type => 'class' do
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

    [ 'php82-php-common',
      'php82-php-bcmath',
      'php82-php-cli',
      'php82-php-dba',
      'php82-php-devel',
      'php82-php-enchant',
      'php82-php-gd',
      'php82-php-imap',
      'php82-php-intl',
      'php82-php-mbstring',
      'php82-php-mysqlnd',
      'php82-php-odbc',
      'php82-php-pdo',
      'php82-php-pear',
      'php82-php-pecl-memcache',
      'php82-php-pgsql',
      'php82-php-process',
      'php82-php-soap',
      'php82-php-tidy',
      'php82-php-xml',
      'php82-php-snuffleupagus',
      'php82-php-opcache', ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'installed',
      )}
    end
    [ 'php82-php-recode',
      'php82-php-pecl-sqlite',
      'php82-php-xmlrpc', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end

end
