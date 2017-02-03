[![Build Status](https://travis-ci.org/GeoffWilliams/cron.svg?branch=master)](https://travis-ci.org/GeoffWilliams/cron)
# cron

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module manages file permissions for the cron daemon on RHEL, Solaris and AIX.  On RHEL, `anacron` may also be installed.

## Usage

### cron::anacron
* Install `anacron`
* Manage permissions for:
  * `/etc/anacrontab`

```puppet
include cron::anacron
```

### cron::cron_allow_deny
* Manage the permissions for:
  * `cron.allow`
* Removes `cron.deny`
* Authorises passed in list of users in `cron.allow` by ensuring that each user is present in the file (does not delete existing entries)

```puppet
class {"cron::cron_allow_deny":
  allow_users => ['root', 'adm'],
}
```

### cron::protect_config
* Normally applies to modern RHEL cron daemons
* Manage permissions for:
  * `/etc/crontab`
  * `/etc/cron.hourly`
  * `/etc/cron.daily`
  * `/etc/cron.weekly`
  * `/etc/cron.monthly`
  * `/etc/cron.d`

```puppet
include cron::protect_config
```

### cron::protect_log
* Protect cron's log file by enforcing correct permissions

```puppet
include cron::protect_log
```

### cron::protect_spool
* Protect cron's spool files and directories by enforcing correct permissions:
  * `root`'s crontab restricted to `0700`
  * All crontabs restricted to `0770`
  * All crontabs owned by the correct group (`root` for RedHat and Solaris, `cron` on AIX)

```puppet
include cron::protect_spool
```

### cron::protect_var
* Protect cron's `/var` directory by enforcing correct permissions (Solaris)

```puppet
include cron::protect_var
```

### Suggested per-OS usage

#### RHEL

```puppet
include cron::anacron
include cron::protect_config
include cron::protect_log
```

#### Solaris

```puppet
class {"cron::cron_allow_deny":
  allow_users => ['root'],
}include cron::protect_log
include cron::protect_var
```

#### AIX

```puppet
class {"cron::cron_allow_deny":
  allow_users => ['root', 'adm'],
}
include cron::protect_log
include cron::protect_spool
```

## Reference

### Classes
* `cron::anacron` Manage anacron package and permissons on anacrontab (RedHat)
* `cron::cron_allow_deny` Control permissions and content on cron.allow/cron.deny (AIX, Solaris)
* `cron::params` Params pattern
* `cron::protect_configs` Protect configuration file permissions (RedHat)
* `cron::protect_log` Protect the log file with correct permissions (RedHat, AIX, Solaris)
* `cron::protect_spool` Protect the spool directories (RedHat, AIX, Solaris)
* `cron::protect_var` Protect cron's directory under /var (Solaris)


## Limitations

* Assumes that cron itself is already installed
* Does not attempt to manage the cron services
* Not supported by Puppet, Inc.

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
