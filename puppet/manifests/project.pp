class project {
  include params

  # Go project
  class { 'projects::go':
    db_type       => $params::db_type,
    db_name       => $params::db_name,
    db_user       => $params::db_user,
    db_password   => $params::db_password,
  }

  # nodejs project
  #class { 'projects::node_js':
  #  packages => [ "socket.io", "mysql" ],
  #}

  # PHP project
  #class { 'projects::php':
  #  project_url   => $params::project_url,
  #  db_type       => $params::db_type,
  #  db_name       => $params::db_name,
  #  db_user       => $params::db_user,
  #  db_password   => $params::db_password,
  #}

  ## project specific stuff

  ### deploy
  #package { 'rubygems':
  #  ensure => 'latest'
  #}

  #exec { 'install capifony using RubyGems':
  #  command => 'gem install capifony',
  #  require => Package['rubygems'],
  #  path    => '/usr/bin/',
  #  unless  => 'gem list | /bin/grep capifony',
  #}

  #exec { 'install capistrano_rsync_with_remote_cache using RubyGems':
  #  command => 'gem install capistrano_rsync_with_remote_cache',
  #  require => Exec['install capifony using RubyGems'],
  #  path    => '/usr/bin/',
  #  unless  => 'gem list | /bin/grep capistrano_rsync_with_remote_cache',
  #}

  ### usefull packages
  #package { 'acl':      # for Symfony projects
  #  ensure => 'latest'
  #}
}
