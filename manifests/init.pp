# scl for EL6
class scl {
  package{'centos-release-SCL':
    ensure => present,
  }
  # don't cleanup the repo
  file{'/etc/yum.repos.d/CentOS-SCL.repo':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  # SCLs are currently a little bit in a blocked state for official centos.
  # That's why we use SL for the time being for SCL 1.1
  # http://lists.centos.org/pipermail/centos-devel/2014-August/011772.html
  yum::repo{
    'softwarecollections':
      descr         => 'Scientific Linux Software Collections - $basearch',
      baseurl       => 'http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/$basearch/',
      enabled       => 1,
      priority      => 5,
      gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl6',
      gpgkey_source => 'puppet:///modules/scl/gpgkeys/RPM-GPG-KEY-sl6',
  }
}
