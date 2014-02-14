# scl the new cloud way
class scl {
  package{'centos-release-SCL':
    ensure => present,
  }
  # don't cleanup the repo
  file{'/etc/yum.repos.d/CentOS-SCL.repo':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }
}
