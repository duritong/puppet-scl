# scl for centos
class scl {
  package{'centos-release-SCL':
    ensure => absent,
  } -> package{'centos-release-scl':
    ensure => present,
  }
  # don't cleanup the repo
  file{'/etc/yum.repos.d/CentOS-SCLo-scl.repo':
    ensure  => present,
    require => Package['centos-release-scl'],
  }
}
