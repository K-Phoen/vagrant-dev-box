class projects::go($db_type, $db_name, $db_user, $db_password) {
  class { 'golang':
    version   => '1.3.3',
    workspace => '/home/vagrant/go',
  }

  # db
  class { 'db':
    type => $db_type,
  }
  db::db { "db_$db_name":
    dbname   => $db_name,
    user     => $db_user,
    password => $db_password,
  }
}
