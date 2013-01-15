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
    unless  => 'gem list | /bin/grep capifony',
  }

  exec { 'install capistrano_rsync_with_remote_cache using RubyGems':
    command => 'gem install capistrano_rsync_with_remote_cache',
    require => Exec['install capifony using RubyGems'],
    path    => '/usr/bin/',
    unless  => 'gem list | /bin/grep capistrano_rsync_with_remote_cache',
  }
}
