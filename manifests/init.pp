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
  $package         = 'UNSET',
  $version         = 'UNSET',
  $repo_name       = 'UNSET',
  $repo_baseurl    = 'UNSET',
  $repo_key        = 'UNSET',
  $repo_repos      = 'UNSET',
  $repo_release    = 'UNSET',
  $repo_pin        = 'UNSET',
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

  include mongodb::params

  $package_real = $package ? {
    'UNSET' => $::mongodb::params::package,
    default => $package,
  }

  $version_real = $version ? {
    'UNSET' => $::mongodb::params::version,
    default => $version,
  }

  $repo_name_real = $repo_name ? {
    'UNSET' => $::mongodb::params::repo_name,
    default => $repo_name,
  }

  $repo_baseurl_real = $repo_baseurl ? {
    'UNSET' => $::mongodb::params::repo_baseurl,
    default => $repo_baseurl,
  }

  $repo_key_real = $repo_key ? {
    'UNSET' => $::mongodb::params::repo_key,
    default => $repo_key,
  }

  $repo_repos_real = $repo_repos ? {
    'UNSET' => $::mongodb::params::repo_repos,
    default => $repo_repos,
  }

  $repo_release_real = $repo_release ? {
    'UNSET' => $::mongodb::params::repo_release,
    default => $repo_release,
  }

  $repo_pin_real = $repo_pin ? {
    'UNSET' => $::mongodb::params::repo_pin,
    default => $repo_pin,
  }

  anchor {'mongodb::start': }->
  class {'mongodb::package':
    repo_name    => $repo_name_real,
    repo_baseurl => $repo_baseurl_real,
    repo_key     => $repo_key_real,
    repo_repos   => $repo_repos_real,
    repo_release => $repo_release_real,
    repo_pin     => $repo_pin_real,
    package      => $package_real,
    version      => $version_real,
  } ~>
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
  }~>
  class {'mongodb::service': } ~>
  anchor {'mongodb::end':}

}
