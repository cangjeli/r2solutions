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
	-dir /usr/local/apache2/conf \
	-bin /usr/local/apache2/bin/httpd \
	-script /usr/local/apache2/bin/apachectl \

exit $#
