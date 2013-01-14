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

  apache::vhost { 'project.loc':
    docroot     => '/home/vagrant/www/project.loc/',
    vhost_name  => '*',
    port        => '80',
  }

  mysql::db { 'mydb':
    user     => 'myuser',
    password => 'mypass',
    host     => 'localhost',
    grant    => ['all'],
  }

  # deploy
  package { 'rubygems':
    ensure => 'installed'
  }

  exec { 'install capifony using RubyGems':
    command => 'gem install capifony',
    require => Package['rubygems'],
    path    => '/usr/bin/',
  }

  exec { 'install capistrano_rsync_with_remote_cache using RubyGems':
    command => 'gem install capistrano_rsync_with_remote_cache',
    require => Exec['install capifony using RubyGems'],
    path    => '/usr/bin/',
  }
}

class user {
  $devPackages = [ 'vim', 'zsh', 'curl', 'git', ]
  package { $devPackages:
    ensure => 'installed',
    require => Exec['aptitude update'],
  }
}

include box
include project
include user
