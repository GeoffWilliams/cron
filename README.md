[![Build Status](https://travis-ci.org/GeoffWilliams/cron.svg?branch=master)](https://travis-ci.org/GeoffWilliams/cron)
# cron

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with cron](#setup)
    * [What cron affects](#what-cron-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with cron](#beginning-with-cron)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module manages security settings for the cron daemon on RHEL, Solaris and AIX.  On RHEL, `anacron` will also be installed.

## Setup

### What cron affects

#### RHEL
* Install `anacron`
* Manage permissions for:
  * `/etc/anacrontab`
  * `/etc/crontab`
  * `/var/log/cron`
  * `/etc/cron.hourly`
  * `/etc/cron.daily`
  * `/etc/cron.weekly`
  * `/etc/cron.monthly`
  * `/etc/cron.d`

#### Solaris
* Manage the permissions for:
  * `/var/cron`
  * `/etc/cron.d/cron.allow`
* Removes `/etc/cron.d/cron.deny`
* Authorises passed in list of users in `cron.allow` by ensuring that each user is present in the file

#### AIX
* Manage the permissions for:
  * `/etc/cron.d/cron.allow`
* Removes `/etc/cron.d/cron.deny`
* Authorises passed in list of users in `cron.allow` by ensuring that each user is present in the file

## Usage

To avoid peppering the code with if statements, a separate class is created for each OS Family.  The correct class can then be included as required as part of an SOE

### RedHat
```puppet
class {"cron::redhat":}
```

### Solaris
```puppet
class {"cron::solaris":}
```

#### Allowing specific users
```puppet
class {"cron::solaris":
  allow_users => ['root']
}
```

### AIX
```puppet
class {"cron::aix":}
```

#### Allowing specific users
```puppet
class {"cron::aix":
  allow_users => ['root','adm']
}
```

## Reference

### Classes
* cron::aix - specific settings for AIX
* cron::cron_allow_deny - shared logic for controlling cron.allow/cron.deny
* cron::params - params pattern
* cron::redhat - specific settings for RedHat
* cron::solaris - specific settings for Solaris

## Limitations

* Assumes that cron itself is already installed
* Does not attempt to manage the cron services

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example
