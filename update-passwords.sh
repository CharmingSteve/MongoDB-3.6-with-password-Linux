#!/bin/bash

# Written by charmingcloud.net in order to follow AWS security - It sets the Mysql and Wordpress passwords to Amazon Instance ID
# /usr/local/sbin/update-passwords.sh
file="/usr/local/share/passwords-set-to-image-id"
        if [ -f "$file" ]
        then
                echo "$file found."
                exit 1
        else
sudo yum -y update

        NEWPASS=$(/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id)


sed -i -- "s/INSTANCE-ID/$NEWPASS/g"  /usr/local/sbin/charming-mongo-passwd.js

mongo admin -u charming -p INSTANCE-ID  < /usr/local/sbin/charming-mongo-passwd.js

        touch /usr/local/share/passwords-set-to-image-id
#for getting phpmyadmin to work
#sudo mysql -p "$NEWPASS"> flush hosts;
        fi
exit 0

