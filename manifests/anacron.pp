# Cron::Anacron
#
# Installs the anacron package and manages permissions on the anacrontab
#
# @params package Anacron package to install
# @param anacrontab manage the permissions on this anacrontab file
class cron::anacron(
  String $package    = $cron::params::package,
  String $anacrontab = $cron::params::anacrontab,
) inherits cron::params {
  package { $package:
    ensure => present,
  }

  file { $anacrontab:
    ensure => file,
    owner  => "root",
    group  => "root",
    mode   => "0600",
  }

}
