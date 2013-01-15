class box {
  include params

  class { 'system_update':  stage => first }

  class { 'apache':
    default_mods => false
  }
  apache::mod { 'rewrite': }
  apache::mod { 'deflate': }

  class { 'mysql::server': }

  class { 'php::apache2': }
  file { "/etc/php5/conf.d/custom.ini":
    ensure => 'present',
    owner  => root,
    group  => root,
    mode   => 664,
    source => "/vagrant/conf/php/custom.ini",
    notify => Service['apache2'],
  }
  php::module { [
    'apc', 'xsl', 'curl', 'mcrypt', 'memcached', 'mysql', 'xdebug',
    ]:
  }
}
