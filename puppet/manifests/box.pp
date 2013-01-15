class box {
  include params

  class { 'system_update':  stage => first }

  class { 'apache':
    default_mods => false,
  }
  apache::mod { 'rewrite': }
  apache::mod { 'deflate': }

  class { 'mysql::server': }

  package { [ 'php5', 'php5-cli', 'libapache2-mod-php5' ]:
    ensure  => 'installed',
    notify  => Service['apache2'],
  }
  package { [
    'php5-apc', 'php5-xsl', 'php5-curl', 'php5-mcrypt', 'php5-memcached', 'php5-mysql', 'php5-xdebug',
    ]:
    ensure  => 'installed',
    notify  => Service['apache2'],
    require => Package['php5'],
  }
  file { "/etc/php5/conf.d/custom.ini":
    ensure  => 'present',
    mode    => 644,
    source  => "/vagrant/conf/php/custom.ini",
    notify  => Service['apache2'],
    require => Package['php5'],
  }

  package { 'acl':
    ensure => 'installed'
  }
}
