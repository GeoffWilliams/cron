class cron::redhat(
    String $package    = $cron::params::package,
    String $anacrontab = $cron::params::anacrontab,
    String $crontab    = $cron::params::crontab,
    Array $cron_dirs   = $cron::params::cron_dirs,
    String $cron_log   = $cron::params::cron_log,
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

  file { [$crontab, $cron_log]:
    ensure => file,
  }

  file { $cron_dirs:
    ensure => directory,
    mode   => "0700",
  }
}
