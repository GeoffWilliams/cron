class cron::params {
  case $facts["os"]["family"] {
    "RedHat": {
      $package    = "cronie-anacron"
      $anacrontab = "/etc/anacrontab"
      $crontab    = "/etc/crontab"
      $cron_log  = "/var/log/cron"
      $cron_dirs  = [
        "/etc/cron.hourly",
        "/etc/cron.daily",
        "/etc/cron.weekly",
        "/etc/cron.monthly",
        "/etc/cron.d",
      ]
    }
    default: {
      fail("Class ${name} does not support ${facts["os"]["family"]} yet")
    }
  }

}
