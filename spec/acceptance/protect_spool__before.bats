# BATS test file to run before executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...

@test "bad permissions on /var/spool/cron/crontabs/inky" {
  [[ $(stat -c %a /var/spool/cron/crontabs/inky) == "777" ]]
}

@test "bad permissions on /var/spool/cron/crontabs/blinky" {
  [[ $(stat -c %a /var/spool/cron/crontabs/blinky) == "777" ]]
}

@test "bad permissions on /var/spool/cron/crontabs/pinky" {
  [[ $(stat -c %a /var/spool/cron/crontabs/pinky) == "777" ]]
}

@test "bad permissions on /var/spool/cron/crontabs/clyde" {
  [[ $(stat -c %a /var/spool/cron/crontabs/clyde) == "777" ]]
}

@test "bad permissions on /var/spool/cron/crontabs" {
  [[ $(stat -c %a /var/spool/cron/crontabs) == "777" ]]
}

@test "bad group on /var/spool/cron/crontabs/inky" {
  [[ $(stat -c %G /var/spool/cron/crontabs/inky) == "badgroup" ]]
}

@test "bad group on /var/spool/cron/crontabs/blinky" {
  [[ $(stat -c %G /var/spool/cron/crontabs/blinky) == "badgroup" ]]
}

@test "bad group on /var/spool/cron/crontabs/pinky" {
  [[ $(stat -c %G /var/spool/cron/crontabs/pinky) == "badgroup" ]]
}

@test "bad group on /var/spool/cron/crontabs/clyde" {
  [[ $(stat -c %G /var/spool/cron/crontabs/clyde) == "badgroup" ]]
}

@test "bad group on /var/spool/cron/crontabs" {
  [[ $(stat -c %G /var/spool/cron/crontabs) == "badgroup" ]]
}
