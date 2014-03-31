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
class mongodb::service($name) {

  service {'mongodb':
    name   => $name,
    ensure => running,
    enable => true,
  }

}
