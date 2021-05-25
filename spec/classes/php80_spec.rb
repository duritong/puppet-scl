require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php80', :type => 'class' do
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

    [ 'php80-php-common',
      'php80-php-bcmath',
      'php80-php-cli',
      'php80-php-dba',
      'php80-php-devel',
      'php80-php-enchant',
      'php80-php-gd',
      'php80-php-imap',
      'php80-php-intl',
      'php80-php-mbstring',
      'php80-php-mysqlnd',
      'php80-php-odbc',
      'php80-php-pdo',
      'php80-php-pear',
      'php80-php-pecl-memcache',
      'php80-php-pgsql',
      'php80-php-process',
      'php80-php-soap',
      'php80-php-tidy',
      'php80-php-xml',
      'php80-php-snuffleupagus',
      'php80-php-opcache', ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
    [ 'php80-php-recode',
      'php80-php-pecl-sqlite',
      'php80-php-xmlrpc', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end

end
