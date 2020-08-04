require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php74', :type => 'class' do
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

    [ 'php74-php-common',
      'php74-php-bcmath',
      'php74-php-cli',
      'php74-php-dba',
      'php74-php-devel',
      'php74-php-enchant',
      'php74-php-gd',
      'php74-php-imap',
      'php74-php-intl',
      'php74-php-mbstring',
      'php74-php-mysqlnd',
      'php74-php-odbc',
      'php74-php-pdo',
      'php74-php-pear',
      'php74-php-pecl-memcache',
      'php74-php-pgsql',
      'php74-php-process',
      'php74-php-soap',
      'php74-php-tidy',
      'php74-php-xml',
      'php74-php-xmlrpc',
      'php74-php-snuffleupagus',
      'php74-php-opcache', ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
    [ 'php74-php-recode',
      'php74-php-pecl-sqlite', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end

end
