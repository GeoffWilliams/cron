# Class: cron
# ===========================
#
# Full description of class cron here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'cron':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class cron(
    $package    = $cron::params::package,
    $anacrontab = $cron::params::anacrontab,
    $crontab    = $cron::params::crontab,
    $cron_dirs  = $cron::params::cron_dirs,
) inherits cron::params {

  File {
    owner => "root",
    group => "root",
    mode  => "0600",
  }

  package { $package:
    ensure => present,
  }

  file { $anacrontab:
    ensure => file,
  }

  file { $crontab:
    ensure => file,
  }

  file { $cron_dirs:
    ensure => directory,
    mode   => "0700",
  }
}