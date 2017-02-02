# Cron::Cron_allow_deny
#
# Mange cron.deny and cron.allow, optionally add users to cron.allow
class cron::cron_allow_deny(
  String $cron_allow_file,
  String $cron_deny_file,
  Array $allow_users,
) {

  File {
    owner => "root",
    group => "root",
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
      ensure => present,
      line   => $user,
      path   => $cron_allow_file,
    }
  }

}
