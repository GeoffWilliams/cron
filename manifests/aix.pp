class cron::aix(
    Array $allow_users      = [],
    String $cron_allow_file = $cron::params::cron_allow_file,
    String $cron_deny_file  = $cron::params::cron_deny_file,
) inherits cron::params {

  class { "cron::cron_allow_deny":
    cron_allow_file => $cron_allow_file,
    cron_deny_file  => $cron_deny_file,
    allow_users     => $allow_users,
  }

}
