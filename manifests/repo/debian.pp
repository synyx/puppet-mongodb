# == Class: mongodb::repo::debian
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class mongodb::repo::debian (
  $repo_name,
  $baseurl,
  $release,
  $repos,
  $key_source,
  $pin
) {

  apt::source { $repo_name:
    location => $baseurl,
    release => $release,
    repos => $repos,
    key => $repo_name,
    key_source => $key_source,
    pin => $pin,
    include_src => false,
  }

}
