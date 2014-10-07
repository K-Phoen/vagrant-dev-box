class db($type) {
  case $type {
    'mongodb': { include db::mongodb }
    'mysql': { include db::mysql }
    'postgresql': {
      class { 'db::postgresql':
        version => '9.1',
      }
    }
    default: { fail('Only mysql and postgresql are supported') }
  }

  define db ($dbname, $user, $password) {
    if $db::type == 'mongodb' {
      mongodb::db { $dbname:
        user     => $user,
        password => $password,
      }
    }

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
