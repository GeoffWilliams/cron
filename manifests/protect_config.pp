# Cron::Protect_config
#
# Protect cron configuration files by enforcing correct permissions.  Geared
# around the requirements of modern RHEL cron daemons
#
# @param config_group File group owner to enforce
# @param crontab Crontab file to manage permissions on
# @param cron_dirs Directories we need to enforce correct permissions on
class cron::protect_config(
    String $config_group  = $cron::params::config_group,
    String $crontab       = $cron::params::crontab,
    Array  $cron_dirs     = $cron::params::cron_dirs,
) inherits cron::params {

  File {
    owner => "root",
    group => $config_group,
    mode  => "0600",
  }


  file { [$crontab, $cron_log]:
    ensure => file,
  }

  file { $cron_dirs:
    ensure => directory,
    mode   => "0700",
  }
}
