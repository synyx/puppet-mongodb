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

  $repo_name = $::mongodb_repo_name ? {
    undef   => 'mongodb',
    default => $::mongodb_repo_name
  }

  $repo_baseurl = $::mongodb_repo_baseurl ? {
    undef   => $::operatingsystem ? {
      Debian  => 'http://downloads-distro.mongodb.org/repo/debian-sysvinit/',
      Ubuntu  => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
      default => fail("${::operatingsystem} is not supported by ${module_name}")
    },
    default => $::mongodb_repo_baseurl
  }

  $repo_key = $::mongodb_repo_key ? {
    undef   => '7F0CEB10',
    default => $::mongodb_repo_key
  }

  $repo_repos = $::virtualbox_repo_repos ? {
    undef   => '10gen',
    default => $::virtualbox_repo_release
  }

  $repo_release = $::mongodb_repo_release ? {
    undef   => $::osfamily ? {
      'Debian' => 'dist',
       default => fail("${::osfamily} is not supported by ${module_name}")
    },
    default => $::mongodb_repo_release
  }

  $repo_pin = $::mongodb_repo_pin ? {
    undef   => 200,
    default => $::mongodb_repo_pin
  }

  $dist_package = $::osfamily ? {
    'Debian' => 'mongodb-10gen',
    default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  $package = $::mongodb_package ? {
    undef   => $dist_package,
    default => $::mongodb_package
  }

  $version = $::mongodb_version ? {
    undef   => 'installed',
    default => $::mongodb_version
  }
}

