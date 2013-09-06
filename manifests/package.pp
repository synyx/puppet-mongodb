# == Class: mongodb::package
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class mongodb::package(
  $repo_name,
  $repo_baseurl,
  $repo_key,
  $repo_repos,
  $repo_release,
  $repo_pin,
  $package,
  $version,
) {
  class { 'mongodb::repo':
    repo_name  => $repo_name,
    baseurl    => $repo_baseurl,
    key        => $repo_key,
    repos      => $repo_repos,
    release    => $repo_release,
    pin        => $repo_pin,
    before     => Package[$package],
  }

  package { $package:
    ensure  => $version,
    require => Class['mongodb::repo'],
  }
}
