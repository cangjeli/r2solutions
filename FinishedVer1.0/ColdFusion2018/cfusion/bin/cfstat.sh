#!/bin/bash

CFUSION_HOME=$(cd "$(dirname "$0")"; pwd)/..

#
# This sets _JAVACMD.
#
. $CFUSION_HOME/bin/findjava.sh

# Call coldfusion.tools.CfstatMain with the found settings
${_JAVACMD} -cp $CFUSION_HOME/lib/cfusion.jar:$CFUSION_HOME/lib/closure-compiler.jar coldfusion.tools.CfstatMain \
	$1 \
	$2 \
	$3 \
	$4 \
	$5 
