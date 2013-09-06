# == Class: mongodb::service
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class mongodb::service {
  service {"mongodb":
    ensure => running,
    enable => true,
  }
}
