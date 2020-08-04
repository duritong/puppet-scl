require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::php56', :type => 'class' do
  let(:pre_condition){ 'include yum::prerequisites
                       Exec{ path => "/usr" }' }
  describe 'with standard on el7' do
    let(:facts){
      {
        :operatingsystemmajrelease => '7',
        :os => {
          :release => {
            :major => '7',
          },
        },
      }
    }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('scl') }

    [ 'php56-php-common',
      'php56-php-bcmath',
      'php56-php-cli',
      'php56-php-dba',
      'php56-php-devel',
      'php56-php-enchant',
      'php56-php-gd',
      'php56-php-imap',
      'php56-php-intl',
      'php56-php-mbstring',
      'php56-php-mysqlnd',
      'php56-php-odbc',
      'php56-php-pdo',
      'php56-php-pear',
      'php56-php-pecl-memcache',
      'php56-php-pgsql',
      'php56-php-process',
      'php56-php-recode',
      'php56-php-soap',
      'php56-php-tidy',
      'php56-php-xml',
      'php56-php-xmlrpc' ].each do |p|
      it { is_expected.to contain_package(p).with(
        :ensure => 'present',
      )}
    end
    [ 'php56-php-pecl-sqlite', ].each do |p|
      it { is_expected.to_not contain_package(p) }
    end
  end
end
