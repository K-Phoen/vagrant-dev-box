class box {
  include params

  class { 'system_update':  stage => first }
}
