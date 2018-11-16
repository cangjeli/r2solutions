#!/bin/sh

# Upgrade/update all the currently installed connectors.
../../runtime/bin/wsconfig -upgrade -v

exit $#
