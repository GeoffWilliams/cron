# Cron::Params
#
# Params pattern for cron module
class cron::params {
  case $facts["os"]["family"] {
    "RedHat": {
      $package    = "cronie-anacron"
      $anacrontab = "/etc/anacrontab"
      $crontab    = "/etc/crontab"
      $cron_log   = "/var/log/cron"
      $cron_dirs  = [
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
      $file_group       = "sys"
    }
    "Solaris": {
      $var_cron        = "/var/cron"
      $cron_allow_file = "/etc/cron.d/cron.allow"
      $cron_deny_file  = "/etc/cron.d/cron.deny"
      $file_group       = "root"
    }
    default: {
      fail("Class ${name} does not support ${facts['os']['family']} yet")
    }
  }

}
