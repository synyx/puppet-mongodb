# == Class: mongodb::repo
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class mongodb::repo (
  $repo_name,
  $baseurl,
  $repos,
  $release,
  $pin,
  $key,
  $key_source,
  $gpgcheck,
  $enabled,
) {

  anchor {'mongodb::repo::begin': }
  anchor {'mongodb::repo::end': }

  case $::osfamily {
    'Debian': {
      class {'mongodb::repo::debian':
        repo_name  => $repo_name,
        baseurl    => $baseurl,
        key        => $key,
        key_source => $key_source,
        repos      => $repos,
        release    => $release,
        pin        => $pin,
        require    => Anchor['mongodb::repo::begin'],
        before     => Anchor['mongodb::repo::end'],
      }
    }
    'RedHat': {
      class { 'mongodb::repo::redhat':
        repo_name => $repo_name,
        baseurl   => $baseurl,
        gpgkey    => $key_source,
        gpgcheck  => $gpgcheck,
        enabled   => $enabled,
        require   => Anchor['mongodb::repo::begin'],
        before    => Anchor['mongodb::repo::end'],
      }
    }
    default: { fail("${::osfamily} is not supported by ${module_name}") }
  }

}
