#!/bin/sh

#
# Configure the Apache connector.
#	-dir should be the *directory* which contains httpd.conf
#	-bin should be the path to the apache *executable*
#	-script should be the path to the script which is used to 
#		start/stop apache
#
../../runtime/bin/wsconfig \
    -ws apache \
	-dir /etc/apache2 \
	-bin /usr/sbin/httpd \
	-script /usr/sbin/apachectl \

exit $#
