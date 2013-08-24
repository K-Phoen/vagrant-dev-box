import 'params'
import 'system_update'

class box {
  include params

  class { 'system_update':  stage => first }
}
