#mongodb

[![Build Status](https://travis-ci.org/synyx/puppet-mongodb.svg?branch=master)](https://travis-ci.org/synyx/puppet-mongodb)

##Overview

A Puppet module to install and manage mongodb from 10gen repository.

Supported plattform:
* Debian 7
* Ubuntu 12.04
* CentOS 6.5

## Installation

This modules depends on:
* [puppetlabs/apt](https://github.com/puppetlabs/puppetlabs-apt)
* [puppetlabs/stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)

So all repositories have to be checked out:

```bash
git clone https://github.com/synyx/puppet-mongodb.git modules/mongodb
git clone https://github.com/puppetlabs/puppetlabs-apt.git modules/apt
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git modules/stdlib
```

##Usage

All options and configuration can be done through interacting with the parameters
on the main mongodb class.


```puppet
class { 'mongodb':}
```

## Authors

* Johannes Graf ([@grafjo](https://github.com/grafjo))

## License

puppet-elasticsearch is released under the MIT License. See the bundled LICENSE file
for details.
