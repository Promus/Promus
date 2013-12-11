#/bin/sh

#  MailIP.sh
#  Promus
#  Copyright � 2013 by Johannes Frotscher (Date: 23 Mar 2013).

echo "`ifconfig | grep "inet " | grep -vn 127.0.0.1 | cut -c9-21 | head -1`" | mail -s "IP Address of jfrotscher@gmail.com" jfrotscher@gmail.com;
