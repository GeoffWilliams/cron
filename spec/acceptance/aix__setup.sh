#!/bin/bash

# pretend to be AIX
mkdir -p /etc/facter/facts.d
cat <<EOD > /etc/facter/facts.d/fake_os.json
{
    "os": {
	     "family": "AIX"
    }
}
EOD

groupadd badgroup
groupadd cron
mkdir -p /var/adm/cron
touch /var/adm/cron/log
chgrp badgroup /var/adm/cron/log
chmod 777 /var/adm/cron/log

mkdir -p /var/spool/cron/crontabs
touch /var/spool/cron/crontabs/inky
touch /var/spool/cron/crontabs/blinky
touch /var/spool/cron/crontabs/pinky
touch /var/spool/cron/crontabs/clyde
chmod -R 777 /var/spool/cron/crontabs
chgrp -R badgroup /var/spool/cron/crontabs
