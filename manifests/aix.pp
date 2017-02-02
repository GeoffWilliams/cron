class cron::aix(
    $allow_users      = hiera("cron::aix::allow_users", []),
    $cron_allow_file  = $cron::params::cron_allow_file,
    $cron_deny_file   = $cron::params::cron_deny_file,
) inherits cron::params {

  File {
    owner => "root",
    group => "root",
    mode  => "0600",
  }

  file { $cron_allow_file:
    ensure => file,
  }

  file { $cron_deny_file:
    ensure => absent,
  }

  $allow_users.each |$user| {
    file_line { "${cron_allow_file}_user_${user}":
      ensure => present,
      line   => $user,
      path   => $cron_allow_file,
    }
  }
}
