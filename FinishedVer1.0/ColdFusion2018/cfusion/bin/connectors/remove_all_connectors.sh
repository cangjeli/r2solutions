#!/bin/sh


echo "This will remove all the configured web server connectors.  Continue? [y]: "
read REPLY

if [ "$REPLY" = "yes" ] || [ "$REPLY" = "YES" ] || 
   [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ] ||
   [ "$REPLY" = "" ] ; then

    # Remove all the currently installed connectors.
    ../../runtime/bin/wsconfig -uninstall 
    exit $#
else
    exit 1
fi

