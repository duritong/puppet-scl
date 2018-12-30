require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php73', :type => 'class' do
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

    [ 'php73-php-common',
      'php73-php-bcmath',
      'php73-php-cli',
      'php73-php-dba',
      'php73-php-devel',
      'php73-php-enchant',
      'php73-php-gd',
      'php73-php-imap',
      'php73-php-intl',
      'php73-php-mbstring',
      'php73-php-mysqlnd',
      'php73-php-odbc',
      'php73-php-pdo',
      'php73-php-pear',
      'php73-php-pecl-memcache',
      'php73-php-pgsql',
      'php73-php-process',
      'php73-php-recode',
      'php73-php-soap',
      'php73-php-tidy',
      'php73-php-xml',
      'php73-php-xmlrpc',
      'php73-php-snuffleupagus',
      'php73-php-opcache', ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
    [ 'php73-php-pecl-sqlite', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end

end
