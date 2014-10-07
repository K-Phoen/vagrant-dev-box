class system_update {
    exec { 'aptitude update':
        command => '/usr/bin/aptitude update',
        #require => File['/etc/apt/sources.list'],
    }
}
