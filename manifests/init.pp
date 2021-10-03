# scl for centos
class scl {
  if versioncmp($facts['os']['release']['major'], '8') < 0 {
    package { 'centos-release-SCL':
      ensure => absent,
    } -> package { 'centos-release-scl':
      ensure => present,
    }
    # don't cleanup the repo
    file { ['/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo',
        '/etc/yum.repos.d/CentOS-SCLo-scl.repo',
      '/etc/yum.repos.d/CentOS-SCLo-scl-rh.repo',]:
        ensure  => file,
        require => Package['centos-release-scl'],
    }
  }
}
