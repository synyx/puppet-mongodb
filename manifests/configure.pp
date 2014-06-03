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
class mongodb::configure (
  $dbpath,
  $logpath,
  $logappend,
  $port,
  $nojournal,
  $cpu,
  $auth,
  $verbose,
  $objcheck,
  $quota,
  $diaglog,
  $nohttpinterface,
  $noscripting,
  $notablescan,
  $noprealloc,
  $nssize,
  $mms_token = undef,
  $mms_name = undef,
  $mms_interval = undef,
  $slave = undef,
  $master = undef,
  $source = undef,
  $only = undef,
  $replset = undef,
) {

  file { '/etc/mongod.conf':
    ensure  => file,
    notify  => Service['mongodb'],
    content => template("${module_name}/mongod.conf.erb"),
  }

}
