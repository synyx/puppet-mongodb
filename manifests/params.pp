# == Class: mongodb::params
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class mongodb::params {


  #
  # MONGODB 10GEN PACKAGE SETUP
  #
  $repo_name = 'mongodb'

  $repo_baseurl = $::operatingsystem ? {
      Debian  => 'http://downloads-distro.mongodb.org/repo/debian-sysvinit/',
      Ubuntu  => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
      /(RedHat|CentOS)/ => "http://downloads-distro.mongodb.org/repo/redhat/os/${::architecture}/",
      default => fail("${::operatingsystem} is not supported by ${module_name}")
  }

  $repo_key = '7F0CEB10'

  $repo_repos = '10gen'

  $repo_release = 'dist'

  $repo_pin = 200

  $repo_key_source = 'http://docs.mongodb.org/10gen-gpg-key.asc'

  $repo_gpgcheck = $::osfamily ? {
    'Debian' => 1,
    'RedHat' => 0, # no signed rpms available - see https://jira.mongodb.org/browse/SERVER-8770
    default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  $repo_enabled = 1

  $package_name = 'mongodb-org'

  $package_version = 'installed'

  $service_name = 'mongod'

  #
  #  MONGODB TEMPLATE PARAMS
  #

  $config_dbpath = '/var/lib/mongodb'

  $config_logpath = '/var/log/mongodb/mongod.log'

  $config_logappend = true

  $config_port = 27017

  $config_bind_ip = '127.0.0.1'

  $config_nojournal = false

  $config_cpu = false

  $config_auth = false

  $config_verbose = 'v'

  $config_objcheck = true

  $config_quota = false

  $config_diaglog = 0

  $config_nohttpinterface = false

  $config_noscripting = false

  $config_notablescan = false

  $config_noprealloc = false

  $config_nssize = 16

}
