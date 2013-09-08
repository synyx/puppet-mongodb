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
  $dbpath          = "UNSET",
  $logpath         = "UNSET",
  $logappend       = "UNSET",
  $port            = "UNSET",
  $nojournal       = "UNSET",
  $cpu             = "UNSET",
  $auth            = "UNSET",
  $verbose         = "UNSET",
  $objcheck        = "UNSET",
  $quota           = "UNSET",
  $diaglog         = "UNSET",
  $nohttpinterface = "UNSET",
  $noscripting     = "UNSET",
  $notablescan     = "UNSET",
  $noprealloc      = "UNSET",
  $nssize          = "UNSET",
  $mms_token       = "UNSET",
  $mms_name        = "UNSET",
  $mms_interval    = "UNSET",
  $slave           = "UNSET",
  $master          = "UNSET",
  $source          = "UNSET",
  $only            = "UNSET",
  $replset         = "UNSET",
) {

  $dbpath_real = $dbpath ? {
    "UNSET" => $::mongodb::params::dbpath,
    default => $dbpath
  }

  $logpath_real = $logpath ? {
    "UNSET" => $::mongodb::params::logpath,
    default => $logpath
  }

  $logappend_real = $logappend ? {
    "UNSET" => $::mongodb::params::logappend,
    default => $logappend
  }

  $port_real = $logappend ? {
    "UNSET" => $::mongodb::params::port,
    default => $logappend
  }

  $nojournal_real = $nojournal ? {
    "UNSET" => $::mongodb::params::nojournal,
    default => $nojournal
  }

  $cpu_real = $cpu ? {
    "UNSET" => $::mongodb::params::cpu,
    default => $cpu
  }

  $auth_real = $auth ? {
    "UNSET" => $::mongodb::params::auth,
    default => $auth
  }

  $verbose_real = $verbose ? {
    "UNSET" => $::mongodb::params::verbose,
    default => $verbose
  }

  $objcheck_real = $objcheck ? {
    "UNSET" => $::mongodb::params::objcheck,
    default => $objcheck
  }

  $quota_real = $quota ? {
    "UNSET" => $::mongodb::params::quota,
    default => $quota
  }

  $diaglog_real = $diaglog ? {
    "UNSET" => $::mongodb::params::diaglog,
    default => $diaglog
  }

  $nohttpinterface_real = $nohttpinterface ? {
    "UNSET" => $::mongodb::params::nohttpinterface,
    default => $nohttpinterface
  }

  $noscripting_real = $noscripting ? {
    "UNSET" => $::mongodb::params::noscripting,
    default => $noscripting
  }

  $notablescan_real = $notablescan ? {
    "UNSET" => $::mongodb::params::notablescan,
    default => $notablescan
  }

  $noprealloc_real = $noprealloc ? {
    "UNSET" => $::mongodb::params::noprealloc,
    default => $noprealloc
  }

  $nssize_real = $nssize ? {
    "UNSET" => $::mongodb::params::nssize,
    default => $nssize
  }

  $mms_token_real = $mms_token ? {
    "UNSET"   => $::mongodb::params::mms_token,
    default => $mms_token
  }

  $mms_name_real =  $mms_name ? {
    "UNSET"   => $::mongodb::params::mms_name,
    default => $mms_name
  }

  $mms_interval_real = $mms_interval ? {
    "UNSET"   => $::mongodb::params::mms_interval,
    default => $mms_interval
  }

  $slave_real = $slave ? {
    "UNSET"   => $::mongodb::params::slave,
    default => $slave
  }

  $master_real = $master ? {
    "UNSET"   => $::mongodb::params::master,
    default => $master
  }

  $source_real = $source ? {
    "UNSET"   => $::mongodb::params::source,
    default => $source
  }

  $only_real = $only ? {
    "UNSET"   => $::mongodb::params::only,
    default => $only
  }

  $replset_real = $replset ? {
    "UNSET"   => $::mongodb::params::replset,
    default => $replset
  }

  file {"/etc/mongodb.conf":
    ensure => file,
    content => template("${module_name}/mongodb.conf.erb"),
    notify => Service["mongodb"],
  }
}
