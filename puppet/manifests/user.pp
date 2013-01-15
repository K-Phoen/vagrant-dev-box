class user {
  $devPackages = [ 'vim', 'zsh', 'curl', 'git', 'most', 'tree', 'htop', ]
  package { $devPackages:
    ensure  => 'installed',
  }
}
