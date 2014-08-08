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
  $package                = $mongodb::params::package_name,
  $version                = $mongodb::params::package_version,
  $service                = $mongodb::params::service_name,
  $repo_name              = $mongodb::params::repo_name,
  $repo_baseurl           = $mongodb::params::repo_baseurl,
  $repo_key               = $mongodb::params::repo_key,
  $repo_key_source        = $mongodb::params::repo_key_source,
  $repo_repos             = $mongodb::params::repo_repos,
  $repo_release           = $mongodb::params::repo_release,
  $repo_pin               = $mongodb::params::repo_pin,
  $repo_gpgcheck          = $mongodb::params::repo_gpgcheck,
  $repo_enabled           = $mongodb::params::repo_enabled,
  $config_dbpath          = $mongodb::params::config_dbpath,
  $config_logpath         = $mongodb::params::config_logpath,
  $config_pidfile         = $mongodb::params::config_pidfile,
  $config_fork            = $mongodb::params::config_fork,
  $config_logappend       = $mongodb::params::config_logappend,
  $config_port            = $mongodb::params::config_port,
  $config_bind_ip         = $mongodb::params::config_bind_ip,
  $config_nojournal       = $mongodb::params::config_nojournal,
  $config_cpu             = $mongodb::params::config_cpu,
  $config_auth            = $mongodb::params::config_auth,
  $config_objcheck        = $mongodb::params::config_objcheck,
  $config_quota           = $mongodb::params::config_quota,
  $config_diaglog         = $mongodb::params::config_diaglog,
  $config_nohttpinterface = $mongodb::params::config_nohttpinterface,
  $config_noscripting     = $mongodb::params::config_noscripting,
  $config_notablescan     = $mongodb::params::config_notablescan,
  $config_noprealloc      = $mongodb::params::config_noprealloc,
  $config_nssize          = $mongodb::params::config_nssize,
  $config_verbose         = undef,
  $config_mms_token       = undef,
  $config_mms_name        = undef,
  $config_mms_interval    = undef,
  $config_slave           = undef,
  $config_master          = undef,
  $config_source          = undef,
  $config_only            = undef,
  $config_replset         = undef,
) inherits mongodb::params {

  anchor {'mongodb::start': }->
  class { 'mongodb::repo':
    repo_name  => $repo_name,
    baseurl    => $repo_baseurl,
    key        => $repo_key,
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
    dbpath          => $config_dbpath,
    logpath         => $config_logpath,
    pidfile         => $config_pidfile,
    fork            => $config_fork,
    logappend       => $config_logappend,
    port            => $config_port,
    bind_ip         => $config_bind_ip,
    nojournal       => $config_nojournal,
    cpu             => $config_cpu,
    auth            => $config_auth,
    verbose         => $config_verbose,
    objcheck        => $config_objcheck,
    quota           => $config_quota,
    diaglog         => $config_diaglog,
    nohttpinterface => $config_nohttpinterface,
    noscripting     => $config_noscripting,
    notablescan     => $config_notablescan,
    noprealloc      => $config_noprealloc,
    nssize          => $config_nssize,
    mms_token       => $config_mms_token,
    mms_name        => $config_mms_name,
    mms_interval    => $config_mms_interval,
    slave           => $config_slave,
    master          => $config_master,
    source          => $config_source,
    only            => $config_only,
    replset         => $config_replset,
  } ~>
  class {'mongodb::service':
    name => $service,
  } ->
  anchor {'mongodb::end':}

}
