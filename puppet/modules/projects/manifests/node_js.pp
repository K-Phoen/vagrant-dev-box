class projects::node_js($packages = '') {
  include nodejs

  if $packages {
    package { $packages:
        provider  => npm,
    }
  }
}
