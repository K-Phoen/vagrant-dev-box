class projects::php($project_url, $db_type, $db_name, $db_user, $db_password)  {
  # db
  class { 'db':
    type => $db_type,
  }
  db::db { "db_$db_name":
    dbname   => $db_name,
    user     => $db_user,
    password => $db_password,
  }

  # webserver
  class { 'apache':
    default_mods => false,
  }
  apache::mod { 'rewrite': }
  apache::mod { 'deflate': }

  file { '/home/vagrant/www':
    ensure => 'directory',
    owner  => 'vagrant',
    group  => 'vagrant',
  }

  file { "/home/vagrant/www/$project_url":
    ensure  => 'directory',
    owner   => 'vagrant',
    group   => 'vagrant',
    require => File['/home/vagrant/www'],
  }

  apache::vhost { $project_url:
    docroot       => "/home/vagrant/www/$project_url/web",
    vhost_name    => '*',
    port          => '80',
    docroot_owner => 'vagrant',
    docroot_group => 'vagrant',
    override      => 'All',
  }

  # php
  package { [ 'php5', 'php5-cli', 'libapache2-mod-php5', 'apache2-mpm-prefork' ]:
    ensure  => 'latest',
    notify  => Service['apache2'],
  }
  package { [
    'php5-xsl', 'php5-curl', 'php5-mcrypt', 'php5-memcached', 'php5-mysql', 'php5-sqlite', 'php5-intl', 'php5-xdebug',
    ]:
    ensure  => 'latest',
    notify  => Service['apache2'],
    require => Package['php5'],
  }
  file { "/etc/php5/mods-available/custom.ini":
    ensure  => 'present',
    mode    => 644,
    source  => "/vagrant/conf/php/custom.ini",
    notify  => Service['apache2'],
    require => Package['php5'],
  }
}
