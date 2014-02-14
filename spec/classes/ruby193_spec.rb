require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl::ruby193', :type => 'class' do
  describe 'with standard' do
    it { should compile.with_all_deps }
    it { should contain_class('scl') }
    it { should contain_package('ruby193-ruby-devel').with(
      :ensure => 'present',
    )}
    it { should contain_package('ruby193-rubygem-bundler').with(
      :ensure => 'present',
    )}
  end
end
