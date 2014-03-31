# == Class: mongodb
#
# Installs mongodb via 10gen repository.
#
# Supported operating systems are:
#   - Ubuntu 12.04 LTS
#
# === Authors
#
# Johannes Graf <graf@synyx.de> 
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class mongodb (
  $package         = $mongodb::params::package_name,
  $version         = $mongodb::params::package_version,
  $service         = $mongodb::params::service_name,
  $repo_name       = $mongodb::params::repo_name,
  $repo_baseurl    = $mongodb::params::repo_baseurl,
  $repo_key_source = $mongodb::params::repo_key_source,
  $repo_repos      = $mongodb::params::repo_repos,
  $repo_release    = $mongodb::params::repo_release,
  $repo_pin        = $mongodb::params::repo_pin,
  $repo_gpgcheck   = $mongodb::params::repo_gpgcheck,
  $repo_enabled    = $mongodb::params::repo_enabled,
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
) inherits mongodb::params {

  anchor {'mongodb::start': }->
  class { 'mongodb::repo':
    repo_name  => $repo_name,
    baseurl    => $repo_baseurl,
    key_source => $repo_key_source,
    repos      => $repo_repos,
    release    => $repo_release,
    pin        => $repo_pin,
    gpgcheck   => $repo_gpgcheck,
    enabled    => $repo_enabled,
  } ->
  class {'mongodb::package':
    package      => $package,
    version      => $version,
  } ->
  class {'mongodb::configure':
    dbpath          => $dbpath,
    logpath         => $logpath,
    logappend       => $logappend,
    port            => $port,
    nojournal       => $nojournal,
    cpu             => $cpu,
    auth            => $auth,
    verbose         => $verbose,
    objcheck        => $objcheck,
    quota           => $quota,
    diaglog         => $diaglog,
    nohttpinterface => $nohttpinterface,
    noscripting     => $noscripting,
    notablescan     => $notablescan,
    noprealloc      => $noprealloc,
    nssize          => $noprealloc,
    mms_token       => $mms_token,
    mms_name        => $mms_name,
    mms_interval    => $mms_interval,
    slave           => $slave,
    master          => $master,
    source          => $source,
    only            => $only,
    replset         => $replset,
  } ~>
  class {'mongodb::service':
    name => $service,
  } ->
  anchor {'mongodb::end':}

}
