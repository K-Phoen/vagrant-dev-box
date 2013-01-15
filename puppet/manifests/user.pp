class user {
  $devPackages = [ 'vim', 'zsh', 'curl', 'git', 'most', ]
  package { $devPackages:
    ensure  => 'installed',
    require => Exec['aptitude update'],
  }
}
