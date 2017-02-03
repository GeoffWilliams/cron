# Cron::Protect_spool
#
# Protect cron's spool directories by enforcing correct permissions
#
# @param spool group Group that spool files must be owned by
# @param crontabs_dir Directory to scan for crontab files
class cron::protect_spool(
  String $spool_group  = $cron::params::spool_group,
  String $crontabs_dir = $cron::params::crontabs_dir,
) inherits cron::params {
  file { "${crontabs_dir}/root":
    ensure => file,
    owner  => "root",
    group  => $spool_group,
    mode   => "0700",
  }

  chmod_r { $crontabs_dir:
    want_mode => "0770",
  }

  chown_r { $crontabs_dir:
    want_group => $spool_group,
    want_user  => false,
  }

}
