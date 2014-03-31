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
      /(RedHat|CentOS)/ => "http://downloads-distro.mongodb.org/repo/redhat/os/${architecture}/",
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

  $package_name = $::osfamily ? {
    'Debian' => 'mongodb-10gen',
    'RedHat' => 'mongo-10gen-server',
    default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  $package_version = 'installed'

  $service_name = $::osfamily ? {
    'Debian' => 'mongodb',
    'RedHat' => 'mongod',
    default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  #
  #  MONGODB TEMPLATE PARAMS
  #

  $dbpath = $::mongodb_dbpath ? {
    undef   => '/var/lib/mongodb',
    default => $::mongodb_dbpath
  }

  $logpath = $::mongodb_logpath ? {
    undef   => '/var/log/mongodb/mongodb.log',
    default => $::mongodb_logpath
  }

  $logappend = $::mongodb_logappend ? {
    undef   => true,
    default => $::mongodb_logappend
  }

  $port = $::mongodb_port ? {
    undef   => 27017,
    default => $::mongodb_port
  }

  $nojournal = $::mongodb_nojournal ? {
    undef   => false,
    default => $::mongodb_nojournal
  }

  $cpu = $::mongodb_cpu ? {
    undef   => false,
    default => $::mongodb_cpu
  }

  $auth = $::mongodb_auth ? {
    undef   => false,
    default => $::mongodb_auth
  }

  $verbose = $::mongodb_verbose ? {
    undef   => false,
    default => $::mongodb_verbose
  }
  
  $objcheck = $::mongodb_objcheck ? {
    undef   => true,
    default => $::mongodb_objcheck
  }

  $quota = $::mongodb_objcheck ? {
    undef   => false,
    default => $::mongodb_objcheck
  }

  $diaglog = $::mongodb_diaglog ? {
    undef   => 0,
    default => $::mongodb_diaglog
  }

  $nohttpinterface = $::mongodb_nohttpinterface ? {
    undef   => false,
    default => $::mongodb_nohttpinterface
  }

  $noscripting = $::mongodb_noscripting ? {
    undef   => false,
    default => $::mongodb_noscripting
  }

  $notablescan = $::mongodb_notablescan ? {
    undef   => false,
    default => $::mongodb_notablescan
  }

  $noprealloc = $::mongodb_noprealloc ? {
    undef   => false,
    default => $::mongodb_noprealloc
  }

  $nssize = $::mongodb_nssize ? {
    undef   => 16,
    default => $::mongodb_nssize
  }

  $mms_token = $::mongodb_mms_token ? {
    default => $::mongodb_mms_token
  }

  $mms_name = $::mongodb_mms_name ? {
    default => $::mongodb_mms_name
  }

  $mms_interval = $::mongodb_mms_interval ? {
    default => $::mongodb_mms_interval
  }

  $slave = $::mongodb_slave ? {
    default => $::mongodb_slave
  }

  $master = $::mongodb_master ? {
    default => $::mongodb_master
  }

  $source = $::mongodb_source ? {
    default => $::mongodb_source
  }

  $only = $::mongodb_only ? {
    default => $::mongodb_only
  }

  $replset = $::mongodb_replset ? {
    default => $::mongodb_replset
  }

}
