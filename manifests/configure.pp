# == Class: mongodb::configure
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class mongodb::configure() {
  file {"/etc/mongodb.conf":
    ensure => file,
    content => template("${module_name}/mongodb.conf.erb"),
    notify => Service["mongodb"],
  }
}
