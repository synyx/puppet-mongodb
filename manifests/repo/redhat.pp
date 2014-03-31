# == Class: mongodb::repo::redhat
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2014 synyx GmbH & Co. KG
#
class mongodb::repo::redhat (
  $repo_name,
  $baseurl,
  $gpgkey,
  $gpgcheck,
  $enabled,
) {

  yumrepo { $repo_name:
    baseurl  => $baseurl,
    gpgkey   => $gpgkey,
    gpgcheck => $gpgcheck,
    enabled  => $enabled,
    descr    => 'MongoDB 10gen Repository',
  }

}
