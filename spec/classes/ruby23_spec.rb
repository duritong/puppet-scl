require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::ruby23', :type => 'class' do
  describe 'with standard' do
    let(:facts) {
      {
        :operatingsystemmajrelease => '7',
      }
    }
    let(:pre_condition){ 'include yum::prerequisites' }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('scl') }
    it { is_expected.to contain_package('rh-ruby23-ruby-devel').with(
      :ensure => 'present',
    )}
    it { is_expected.to contain_package('rh-ruby23-rubygem-bundler').with(
      :ensure => 'present',
    )}
  end
end
