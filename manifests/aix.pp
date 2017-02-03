# # Cron::Aix
# #
# # Manage cron on AIX
# #
# # @param allow_users Array of users to insert into cron.allow
# # @param cron_allow_file File to use for cron.allow
# # @param cron_deny_file File to use for cron.deny
# # @param file_group Group owner for files (cron.allow)
# class cron::aix(
#     Array $allow_users      = [],
#     String $cron_allow_file = $cron::params::cron_allow_file,
#     String $cron_deny_file  = $cron::params::cron_deny_file,
#     String $config_group    = $cron::params::config_group,
#     String $spool_group     = $cron::params::spool_group,
#     String $crontabs_dir    = $cron::params::crontabs_dir,
#     String $cron_log        = $cron::params::cron_log,
# ) inherits cron::params {
#
#   class { "cron::cron_allow_deny":
#     cron_allow_file => $cron_allow_file,
#     cron_deny_file  => $cron_deny_file,
#     allow_users     => $allow_users,
#     config_group    => $config_group,
#   }
#
#   file { $cron_log:
#     ensure => file,
#     owner  => "root",
#     group  => undef,
#     mode   => "0660",
#   }
#
#   file { "${crontabs_dir}/root":
#     ensure => file,
#     owner  => "root",
#     group  => $spool_group,
#     mode   => "0700",
#   }
#
#   chmod_r { $crontabs_dir:
#     want_mode => "0770",
#   }
#
#   chown_r { $crontabs_dir:
#     want_group => $spool_group,
#     want_user  => false,
#   }
# }
