class cron::solaris(
    String $var_cron         = $cron::params::var_cron,
    String $cron_allow_file  = $cron::params::cron_allow_file,
    String $cron_deny_file   = $cron::params::cron_deny_file,
    Array $allow_users       = [],
) inherits cron::params {


  file { $var_cron:
    ensure => directory,
    owner  => "root",
    group  => "root",
    mode   => "0700",
  }

  class { "cron::cron_allow_deny":
    cron_allow_file => $cron_allow_file,
    cron_deny_file  => $cron_deny_file,
    allow_users     => $allow_users,
  }
}
