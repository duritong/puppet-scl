require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php54', :type => 'class' do
  describe 'with standard' do
    let(:facts) {
      {
        :operatingsystemmajrelease => '7',
      }
    }
    let(:pre_condition){ 'include yum::prerequisites' }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('scl') }

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
      'php54-php-mysqlnd',
      'php54-php-odbc',
      'php54-php-pdo',
      'php54-php-pear',
      'php54-php-pecl-apcu',
      'php54-php-pecl-memcache',
      'php54-php-pgsql',
      'php54-php-process',
      'php54-php-recode',
      'php54-php-soap',
      'php54-php-tidy',
      'php54-php-xml',
      'php54-php-xmlrpc' ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
  end
end
