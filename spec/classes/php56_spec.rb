require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php56', :type => 'class' do
  let(:pre_condition){ 'include yum::prerequisites' }
  describe 'with standard on el7' do
    let(:facts){
      {
        :operatingsystemmajrelease => '7',
      }
    }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('scl') }

    [ 'rh-php56-php-common',
      'rh-php56-php-bcmath',
      'rh-php56-php-cli',
      'rh-php56-php-dba',
      'rh-php56-php-devel',
      'rh-php56-php-enchant',
      'rh-php56-php-gd',
      'more-php56-php-imap',
      'rh-php56-php-intl',
      'rh-php56-php-mbstring',
      'rh-php56-php-mysqlnd',
      'rh-php56-php-odbc',
      'rh-php56-php-pdo',
      'rh-php56-php-pear',
      'rh-php56-php-pecl-memcache',
      'rh-php56-php-pgsql',
      'rh-php56-php-process',
      'rh-php56-php-recode',
      'rh-php56-php-soap',
      'more-php56-php-tidy',
      'rh-php56-php-xml',
      'rh-php56-php-xmlrpc' ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
    [ 'rh-php56-php-pecl-sqlite', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end

  describe 'with standard on el6' do
    let(:facts){
      {
        :operatingsystemmajrelease => '6',
      }
    }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('scl') }

    [ 'rh-php56-php-common',
      'rh-php56-php-bcmath',
      'rh-php56-php-cli',
      'rh-php56-php-dba',
      'rh-php56-php-devel',
      'rh-php56-php-enchant',
      'rh-php56-php-gd',
      'rh-php56-php-intl',
      'rh-php56-php-mbstring',
      'rh-php56-php-mysqlnd',
      'rh-php56-php-odbc',
      'rh-php56-php-pdo',
      'rh-php56-php-pear',
      'rh-php56-php-pecl-memcache',
      'rh-php56-php-pgsql',
      'rh-php56-php-process',
      'rh-php56-php-recode',
      'rh-php56-php-soap',
      'rh-php56-php-xml',
      'rh-php56-php-xmlrpc' ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
    [ 'rh-php56-php-pecl-sqlite',
      'more-php56-php-tidy',
      'more-php56-php-imap', ].each do |p|
        it { is_expected.to_not contain_package(p) }
    end
  end
end
