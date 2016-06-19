require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php55', :type => 'class' do
  describe 'with standard' do
    let(:facts) {
      {
        :operatingsystemmajrelease => '7',
      }
    }
    let(:pre_condition){ 'include yum::prerequisites' }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('scl') }

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
      'php55-php-mysqlnd',
      'php55-php-odbc',
      'php55-php-pdo',
      'php55-php-pear',
      'php55-php-pecl-memcache',
      'php55-php-pgsql',
      'php55-php-process',
      'php55-php-recode',
      'php55-php-soap',
      'php55-php-tidy',
      'php55-php-xml',
      'php55-php-xmlrpc' ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
  end
end
