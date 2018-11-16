#!/bin/bash

CFUSION_HOME=$(cd "$(dirname "$0")"; pwd)/..

#
# This sets _JAVACMD.
#
. $CFUSION_HOME/bin/findjava.sh

${_JAVACMD} -cp $CFUSION_HOME/lib/updates/*:$CFUSION_HOME/lib/* coldfusion.compiler.EncryptCFFiles $1 $2
