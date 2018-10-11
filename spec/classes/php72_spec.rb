require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php72', :type => 'class' do
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

    [ 'php72-php-common',
      'php72-php-bcmath',
      'php72-php-cli',
      'php72-php-dba',
      'php72-php-devel',
      'php72-php-enchant',
      'php72-php-gd',
      'php72-php-imap',
      'php72-php-intl',
      'php72-php-mbstring',
      'php72-php-mysqlnd',
      'php72-php-odbc',
      'php72-php-pdo',
      'php72-php-pear',
      'php72-php-pecl-memcache',
      'php72-php-pgsql',
      'php72-php-process',
      'php72-php-recode',
      'php72-php-soap',
      'php72-php-tidy',
      'php72-php-xml',
      'php72-php-xmlrpc',
      'php72-php-snuffleupagus',
      'php72-php-opcache', ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
    [ 'php72-php-pecl-sqlite', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end

end
