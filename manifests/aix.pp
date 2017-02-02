# Cron::Aix
#
# Manage cron on AIX
#
# @param allow_users Array of users to insert into cron.allow
# @param cron_allow_file File to use for cron.allow
# @param cron_deny_file File to use for cron.deny
# @param file_group Group owner for files (cron.allow) 
class cron::aix(
    Array $allow_users      = [],
    String $cron_allow_file = $cron::params::cron_allow_file,
    String $cron_deny_file  = $cron::params::cron_deny_file,
    String $file_group      = $cron::params::file_group,
) inherits cron::params {

  class { "cron::cron_allow_deny":
    cron_allow_file => $cron_allow_file,
    cron_deny_file  => $cron_deny_file,
    allow_users     => $allow_users,
    file_group      => $file_group,
  }

}
