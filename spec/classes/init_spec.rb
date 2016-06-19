require File.expand_path(File.join(File.dirname(__FILE__),'../spec_helper'))

describe 'scl', :type => 'class' do
  describe 'with standard' do
    let(:facts) {
      {
        :operatingsystemmajrelease => '7',
      }
    }
    let(:pre_condition){ 'include yum::prerequisites' }
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_package('centos-release-SCL').with(
      :ensure => 'absent',
      :before => ['Package[centos-release-scl]'],
    )}
    it { is_expected.to contain_package('centos-release-scl').with(
      :ensure => 'present',
    )}
    ['/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo',
      '/etc/yum.repos.d/CentOS-SCLo-scl.repo',
      '/etc/yum.repos.d/CentOS-SCLo-scl-rh.repo',].each do |f|
      it { is_expected.to contain_file(f).with(
        :ensure  => 'present',
        :require => 'Package[centos-release-scl]',
      )}
    end
  end
end
