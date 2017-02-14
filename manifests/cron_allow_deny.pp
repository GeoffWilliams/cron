# Cron::Cron_allow_deny
#
# Mange cron.deny and cron.allow, optionally add users to cron.allow
#
# @param allow_users Array of users to insert into cron.allow
# @param cron_allow_file File to use for cron.allow
# @param cron_deny_file File to use for cron.deny
# @param config_group Group owner for cron.allow
class cron::cron_allow_deny(
  String $cron_allow_file = $cron::params::cron_allow_file,
  String $cron_deny_file  = $cron::params::cron_deny_file,
  String $config_group    = $cron::params::config_group,
  Array  $allow_users     = [],
) inherits cron::params {

  File {
    owner => "root",
    group => $config_group,
  }

  file { $cron_allow_file:
    ensure => file,
    mode   => "0400",
  }

  file { $cron_deny_file:
    ensure => absent,
  }

  $allow_users.each |$user| {
    file_line { "${cron_allow_file}_user_${user}":
      ensure  => present,
      line    => $user,
      path    => $cron_allow_file,
      require => File[$cron_allow_file],
    }
  }

}
