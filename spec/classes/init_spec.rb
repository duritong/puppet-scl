require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl', :type => 'class' do
  describe 'with standard' do
    it { should compile.with_all_deps }

    it { should contain_package('centos-release-SCL').with(
      :ensure => 'present',
    )}
    it { should contain_file('/etc/yum.repos.d/CentOS-SCL.repo').with(
      :ensure  => 'present',
      :require => 'Package[centos-release-SCL]',
    )}
  end
end
