import 'os_fix'

stage { 'first': }
stage { 'server': }
stage { 'last': }

Stage['first'] -> Stage['main'] -> Stage['last']


class box {
  class { 'system_update':  stage => first }

  class { 'apache':
    default_mods => false
  }
  class { 'apache::mod::php': }
  apache::mod { 'rewrite': }
  apache::mod { 'deflate': }

  class { 'mysql::server':
    config_hash => { 'root_password' => 'toor' },
  }
}

class project {
  file { '/home/vagrant/www':
    ensure => 'directory',
  }

  file { '/home/vagrant/www/project.loc':
    ensure  => 'directory',
    require => File['/home/vagrant/www'],
  }

  apache::vhost { 'project.loc':
    docroot     => '/home/vagrant/www/project.loc/',
    vhost_name  => '*',
    port        => '80',
    require   => File['/home/vagrant/www/project.loc'],
  }

  mysql::db { 'mydb':
    user     => 'myuser',
    password => 'mypass',
    host     => 'localhost',
    grant    => ['all'],
  }
}

include box
include project
