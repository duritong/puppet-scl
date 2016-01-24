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
    ['/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo',
      '/etc/yum.repos.d/CentOS-SCLo-scl.repo',
      '/etc/yum.repos.d/CentOS-SCLo-scl-rh.repo',].each do |f|
      it { should contain_file(f).with(
        :ensure  => 'present',
        :require => 'Package[centos-release-scl]',
      )}
    end
  end
end
