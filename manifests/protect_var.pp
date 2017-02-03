# Cron::Protect_var
#
# Protect cron's directory under /var with the correct permissions.  Normally
# only applied on Solaris
#
# @param var_cron Path to cron's var directory to protect
class cron::protect_var(
    $var_cron = $cron::params::var_cron,
) inherits cron::params {

    file { $var_cron:
      ensure => directory,
      owner  => "root",
      group  => "root",
      mode   => "0700",
    }
}
