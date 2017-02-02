class cron::solaris(
    $var_cron = $cron::params::var_cron,
) inherits cron::params {


  File {
    owner => "root",
    group => "root",
    mode  => "0600",
  }

  file { $var_cron:
    ensure => directory,
    mode   => "0700",
  }
}
