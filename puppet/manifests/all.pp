import 'os_fix'
import 'box'
import 'project'
import 'user'

stage { 'first': }
stage { 'server': }
stage { 'last': }

Stage['first'] -> Stage['main'] -> Stage['last']


class all {
  class { 'box': }
  class { 'project': }
  class { 'user': stage => last }
}

include all
