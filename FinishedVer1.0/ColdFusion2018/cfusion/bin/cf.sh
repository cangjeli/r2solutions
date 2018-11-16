#!/bin/sh
#If you don't wish REPL to print variable values automatically, set the below PRINT_REPL_VARS_AUTO value to false
PRINT_REPL_VARS_AUTO=true

# For EAR/WAR JEE deployments, you will need to modify it to point J2EEJAR to the appropriate JAR file paths as per your application server.

# this should point to the directory with ColdFusions lib directory.
# if this is blank, this is probably a J2EE deployment and this should point
# to the /WEB-INF/cfusion directory
CFUSION_HOME=$(cd "$(dirname "$0")"; pwd)/..

# This needs to point at the JAR file with the J2EE class files in it.
# It defaults to a value that is valid for the server install, but for
# a J2EE install you will need to modify it to point to the appropriate JAR file.
J2EEJAR=$CFUSION_HOME/runtime/lib/servlet-api.jar:$CFUSION_HOME/runtime/lib/jsp-api.jar:$CFUSION_HOME/runtime/lib/el-api.jar

#Following is the example for JBoss library path. Change it and uncomment it as per your Application server's JAR paths. 
#J2EEJAR=/opt/wildfly-12.0.0.Final/modules/system/layers/base/javax/servlet/api/main/jboss-servlet-api_3.1_spec-1.0.2.Final.jar;/opt/wildfly-12.0.0.Final/modules/system/layers/base/javax/servlet/jsp/api/main/jboss-jsp-api_2.3_spec-1.0.3.Final.jar;/opt/wildfly-12.0.0.Final/modules/system/layers/base/javax/el/api/main/jboss-el-api_3.0_spec-1.0.11.Final.jar;/opt/wildfly-12.0.0.Final/modules/system/layers/base/io/undertow/jsp/main/jastow-2.0.3.Final.jar

# This needs to point to the WEB-INF directory for ColdFusion.
if [ -d "$CFUSION_HOME/wwwroot/WEB-INF" ]; then
  WEBINF=$CFUSION_HOME/wwwroot/WEB-INF
else
  WEBINF=$CFUSION_HOME/..
fi


. $CFUSION_HOME/bin/findjava.sh


/bin/sh -c "${_JAVACMD} --add-opens=java.base/java.nio=ALL-UNNAMED --add-modules=java.xml.ws --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/sun.util.cldr=ALL-UNNAMED --add-opens=java.base/sun.util.locale.provider=ALL-UNNAMED -Djava.awt.headless=true -Dcoldfusion.repl.print=$PRINT_REPL_VARS_AUTO -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates:$CFUSION_HOME/lib:$CFUSION_HOME/lib/axis2 -Dcoldfusion.libPath=$CFUSION_HOME/lib -cp $CFUSION_HOME/lib/updates/*:$CFUSION_HOME/lib/*:$CFUSION_HOME/lib/itext/*:$WEBINF/lib/*:$CFUSION_HOME/runtime/lib/*:$CFUSION_HOME/runtime/bin/*:$CFUSION_HOME/bin:$J2EEJAR coldfusion.tools.CLIInvoker CLI $*"
