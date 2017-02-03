# Cron::Protect_log
#
# Protect the cron log file by enforcing correct permissions
#
# @param cron_log Cron log file to manage
# @param cron_log_perm Permissions to enforce on log file
# @param cron_log_owner Owner to enforce on log file
# @param cron_log_group Group to enforce on log file
class cron::protect_log(
    $cron_log       = $cron::params::cron_log,
    $cron_log_perm  = $cron::params::cron_log_perm,
    $cron_log_owner = $cron::params::cron_log_owner,
    $cron_log_group = $cron::params::cron_log_group,
) inherits cron::params {

  file { $cron_log:
    ensure => file,
    owner  => $cron_log_owner,
    group  => $cron_log_group,
    mode   => $cron_log_perm,
  }
}
