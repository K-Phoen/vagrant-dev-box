class user {
  $devPackages = [ 'vim', 'zsh', 'curl', 'git', 'most', 'tree', 'htop', ]
  package { $devPackages:
    ensure  => 'latest',
  }

  exec { '/usr/bin/git clone --recursive git://github.com/K-Phoen/Config.git':
    cwd     => '/home/vagrant',
    creates => '/home/vagrant/Config',
    unless  => '/usr/bin/test -d /home/vagrant/Config',
    user    => 'vagrant',
    group   => 'vagrant',
  }
}
