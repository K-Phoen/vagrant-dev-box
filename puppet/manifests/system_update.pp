class system_update {
    file { "/etc/apt/sources.list":
        owner  => root,
        group  => root,
        mode   => 644,
        source => "/vagrant/conf/apt/source.list",
    }

    file { "/etc/apt/sources.list.d/dotdeb.list":
        owner  => root,
        group  => root,
        mode   => 644,
        source => "/vagrant/conf/apt/dotdeb.list",
    }

    exec { 'dotdeb-apt-key':
        cwd     => '/tmp',
        command => "/usr/bin/wget http://www.dotdeb.org/dotdeb.gpg -O dotdeb.gpg &&
                    /bin/cat dotdeb.gpg | /usr/bin/apt-key add -",
        unless  => '/usr/bin/apt-key list | /bin/grep dotdeb',
        require => File['/etc/apt/sources.list.d/dotdeb.list'],
        notify  => Exec['aptitude update'],
    }

    exec { 'aptitude update':
        command => '/usr/bin/aptitude update',
        require => File['/etc/apt/sources.list'],
    }
}
