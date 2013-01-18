class db($type) {
  case $type {
    'mysql': { include db::mysql }
    'postgresql': {
      class { 'db::postgresql':
        version => '8.4',
      }
    }
    default: { fail('Only mysql and postgresql are supported') }
  }

  define db ($dbname, $user, $password) {
    if $db::type == 'mysql' {
      mysql::db { $dbname:
        user     => $user,
        password => $password,
      }
    }

    if $db::type == 'postgresql' {
      postgresql::db { $dbname:
        user     => $user,
        password => $password,
      }
    }
  }
}
