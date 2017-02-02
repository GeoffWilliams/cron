class cron::redhat(
    $package    = $cron::params::package,
    $anacrontab = $cron::params::anacrontab,
    $crontab    = $cron::params::crontab,
    $cron_dirs  = $cron::params::cron_dirs,
    $cron_log   = $cron::params::cron_log,
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
