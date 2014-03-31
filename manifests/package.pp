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
  $package,
  $version,
) {

  package { $package:
    ensure  => $version,
  }

}
