class db::postgresql($version = undef) {
  class { 'postgresql::params':
    version             => $version,
    manage_package_repo => false,
    package_source      => false
  }

  class { 'postgresql::server':
    package_ensure => 'latest',
  }
}
