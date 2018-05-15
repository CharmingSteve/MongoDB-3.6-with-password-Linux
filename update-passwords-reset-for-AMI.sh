#!/bin/bash

# Written by charmingcloud.net in order to follow AWS security - It sets the Mysql and Wordpress passwords to Amazon Instance ID
# /usr/local/sbin/update-passwords-reset-for-AMI.sh 

/bin/cp -f   /usr/local/sbin/charming-mongo-passwd-orig.js /usr/local/sbin/charming-mongo-passwd.js

NEWPASS=$(/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id)
	  
mongo admin -u charming -p $NEWPASS  < /usr/local/sbin/charming-mongo-passwd.js	  
	  
	  
rm -f /usr/local/share/passwords-set-to-image-id