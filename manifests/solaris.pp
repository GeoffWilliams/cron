# Cron::Solaris
#
# Support for locking down cron on Solaris
#
# @param var_cron Directory under var where cron operates
# @param allow_users Array of users to insert into cron.allow
# @param cron_allow_file File to use for cron.allow
# @param cron_deny_file File to use for cron.deny
# @param file_group Group owner for files (cron.allow)
class cron::solaris(
    String $var_cron        = $cron::params::var_cron,
    String $cron_allow_file = $cron::params::cron_allow_file,
    String $cron_deny_file  = $cron::params::cron_deny_file,
    String $file_group      = $cron::params::file_group,
    Array $allow_users      = [],
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
    file_group      => $file_group,
  }
}
