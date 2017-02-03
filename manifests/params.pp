# Cron::Params
#
# Params pattern for cron module
class cron::params {
  case $facts["os"]["family"] {
    "RedHat": {
      $package          = "cronie-anacron"
      $anacrontab       = "/etc/anacrontab"
      $crontab          = "/etc/crontab"
      $cron_log         = "/var/log/cron"
      $cron_log_perm    = "0600"
      $cron_log_owner   = "root"
      $cron_log_group   = "root"
      $config_group     = "root"
      $crontabs_dir     = "/var/spool/cron"
      $cron_dirs        = [
        "/etc/cron.hourly",
        "/etc/cron.daily",
        "/etc/cron.weekly",
        "/etc/cron.monthly",
        "/etc/cron.d",
      ]
    }
    "AIX": {
      $cron_allow_file  = "/var/adm/cron/cron.allow"
      $cron_deny_file   = "/var/adm/cron/cron.deny"
      $config_group     = "sys"
      $crontabs_dir     = "/var/spool/cron/crontabs"
      $cron_log         = "/var/adm/cron/log"
      $spool_group      = "cron"
      $cron_log_perm    = "0640"
      $cron_log_owner   = "root"
      $cron_log_group   = "root"
    }
    "Solaris": {
      $var_cron         = "/var/cron"
      $cron_allow_file  = "/etc/cron.d/cron.allow"
      $cron_deny_file   = "/etc/cron.d/cron.deny"
      $config_group     = "root"
      $cron_log_perm    = "0600"
      $cron_log         = "/var/cron/log"
      $cron_log_owner   = "root"
      $cron_log_group   = "root"
      $crontabs_dir     = "/var/spool/cron/crontabs"
    }
    default: {
      fail("Class ${name} does not support ${facts['os']['family']} yet")
    }
  }

}
