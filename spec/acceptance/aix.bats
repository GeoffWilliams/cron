# BATS test file to run after executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...
@test "log file bad permissions" {
  [[ $(stat -c %a /var/adm/cron/log) == "660" ]]
}

@test "log file group unchanged (keep customisation)" {
  [[ $(stat -c %G /var/adm/cron/log) == "badgroup" ]]
}

@test "good permissions on /var/spool/cron/crontabs/inky" {
  [[ $(stat -c %a /var/spool/cron/crontabs/inky) == "770" ]]
}

@test "good permissions on /var/spool/cron/crontabs/blinky" {
  [[ $(stat -c %a /var/spool/cron/crontabs/blinky) == "770" ]]
}

@test "good permissions on /var/spool/cron/crontabs/pinky" {
  [[ $(stat -c %a /var/spool/cron/crontabs/pinky) == "770" ]]
}

@test "good permissions on /var/spool/cron/crontabs/clyde" {
  [[ $(stat -c %a /var/spool/cron/crontabs/clyde) == "770" ]]
}

@test "good permissions on /var/spool/cron/crontabs" {
  [[ $(stat -c %a /var/spool/cron/crontabs) == "770" ]]
}

@test "good group on /var/spool/cron/crontabs/inky" {
  [[ $(stat -c %G /var/spool/cron/crontabs/inky) == "cron" ]]
}

@test "good group on /var/spool/cron/crontabs/blinky" {
  [[ $(stat -c %G /var/spool/cron/crontabs/blinky) == "cron" ]]
}

@test "good group on /var/spool/cron/crontabs/pinky" {
  [[ $(stat -c %G /var/spool/cron/crontabs/pinky) == "cron" ]]
}

@test "good group on /var/spool/cron/crontabs/clyde" {
  [[ $(stat -c %G /var/spool/cron/crontabs/clyde) == "cron" ]]
}

@test "good group on /var/spool/cron/crontabs" {
  [[ $(stat -c %G /var/spool/cron/crontabs) == "cron" ]]
}
