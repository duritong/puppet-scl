require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl', :type => 'class' do
  describe 'with standard' do
    let(:pre_condition){ 'include yum::prerequisites' }
    it { should compile.with_all_deps }

    it { should contain_package('centos-release-SCL').with(
      :ensure => 'absent',
      :before => ['Package[centos-release-scl]'],
    )}
    it { should contain_package('centos-release-scl').with(
      :ensure => 'present',
    )}
    it { should contain_file('/etc/yum.repos.d/CentOS-SCLo-scl.repo').with(
      :ensure  => 'present',
      :require => 'Package[centos-release-scl]',
    )}
  end
end
