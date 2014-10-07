class db::mongodb {
  class {'::mongodb::globals':
    manage_package_repo => true,
  }->
  class {'::mongodb::server':
    auth => true,
  }->
  class {'::mongodb::client': }
}
