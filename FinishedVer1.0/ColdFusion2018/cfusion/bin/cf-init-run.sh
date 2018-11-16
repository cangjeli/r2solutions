#!/bin/bash

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin
CF_DIR=$(cd "$(dirname "$0")"; pwd)/..
MULTI_SERVER="false"
VERSION="2018"

osname=`uname`
if [ "$osname" != "Darwin" ]; then
id | grep -w root > /dev/null 2>&1 || {
	echo "$0 must be run as root"
	exit 1
}
fi

install_linux_systemd()
{
    [ -f /etc/systemd/system/cf${VERSION}.service ] && {
        echo "ColdFusion $VERSION appears to already be set up to start on boot"
        exit 2
    }

    echo "[Unit]" > $CF_DIR/bin/cf.service
    echo "Description=Adobe ColdFusion 2018" >> $CF_DIR/bin/cf.service
    echo "After=multi-user.target" >> $CF_DIR/bin/cf.service
    echo "" >> $CF_DIR/bin/cf.service

    echo "[Service]" >> $CF_DIR/bin/cf.service
    echo "ExecStart=$CF_DIR/bin/sysinit start" >> $CF_DIR/bin/cf.service
    echo "ExecStop=$CF_DIR/bin/sysinit stop" >> $CF_DIR/bin/cf.service
    echo "RemainAfterExit=yes" >> $CF_DIR/bin/cf.service
    echo "" >> $CF_DIR/bin/cf.service

    echo "[Install]" >> $CF_DIR/bin/cf.service
    echo "WantedBy=multi-user.target" >> $CF_DIR/bin/cf.service

    mv -f $CF_DIR/bin/cf.service /etc/systemd/system/cf${VERSION}.service
    chmod 755 /etc/systemd/system/cf${VERSION}.service
    systemctl daemon-reload
    systemctl enable cf${VERSION}.service
}

uninstall_linux_systemd()
{
    [ ! -f /etc/systemd/system/cf${VERSION}.service ] && {
        echo "ColdFusion $VERSION does not appear to be added to your init system"
        exit 2
    }

    systemctl disable cf${VERSION}.service
    rm -f /etc/systemd/system/cf${VERSION}.service
    systemctl daemon-reload
}

install_linux() {
	if [ "$OS" = "RedHat" ]; then
		if [ -d /etc/rc.d/init.d ]; then

			 INITDIR=/etc/rc.d/init.d

		elif [ -d /etc/init.d ]; then

			 INITDIR=/etc/init.d
		else
			echo "Error, could not find your init script directory"
			exit 1
		fi
	else
		# SuSE or Ubuntu; services only in /etc/init.d
		if [ -d /etc/init.d ]; then

			 INITDIR=/etc/init.d

		else
			echo "Error, could not find your init script directory"
			exit 1
		fi	
	fi
	

	if [ "$MULTI_SERVER" = "false" ]; then 

	   [ -f $INITDIR/coldfusion_$VERSION ] && {
		echo "ColdFusion $VERSION appears to already be set up to start on boot"
		exit 2
	   }
	elif [ "$MULTI_SERVER" = "true" ]; then 
	   [ -f $INITDIR/coldfusion$VERSIONmulti ] && {
		echo "ColdFusion $VERSION (multiserver) appears to already be set up to start on boot"
		exit 2
	   }
        fi

	
	echo "Creating the ColdFusion $VERSION start script "
	if [ "$MULTI_SERVER" = "false" ]; then 
	     STARTSCRIPT=coldfusion_$VERSION
	     cp -f $CF_DIR/bin/sysinit $INITDIR/$STARTSCRIPT
	     chmod 755 $INITDIR/$STARTSCRIPT
        else	     
	     STARTSCRIPT=coldfusion$VERSIONmulti
	     cp -f $CF_DIR/bin/cf-multi-startup $INITDIR/$STARTSCRIPT
	fi

	
	if [ -x /sbin/chkconfig ]; then
		echo "Adding ColdFusion $VERSION start/kill links"
		/sbin/chkconfig --add $STARTSCRIPT > /dev/null 2>&1
	fi

	if [ -x "$(command -v update-rc.d)" ]; then
                update-rc.d coldfusion_$VERSION defaults
	fi

	echo "Install complete"
}

uninstall_linux() {
	
	if [ "$MULTI_SERVER" = "false" ]; then 
	     STARTSCRIPT=coldfusion_$VERSION
	else
	     STARTSCRIPT=coldfusion$VERSIONmulti
	fi

	RMFILE=
	if [ -f /etc/rc.d/init.d/$STARTSCRIPT ]; then
	
		RMFILE=/etc/rc.d/init.d/$STARTSCRIPT

	elif [ -f /etc/init.d/$STARTSCRIPT ]; then

		RMFILE=/etc/init.d/$STARTSCRIPT

	else
		echo "ColdFusion $VERSION does not appear to be added to your init system"
		exit 2

	fi

	if [ -x /sbin/chkconfig ]; then
		echo "Removing ColdFusion $VERSION start/kill links"
		/sbin/chkconfig --del $STARTSCRIPT > /dev/null 2>&1
	fi

	if [ -x "$(command -v update-rc.d)" ]; then
                update-rc.d -f coldfusion_$VERSION remove
	fi

	echo "Removing the ColdFusion $VERSION start script $RMFILE"
	rm -f $RMFILE

	echo "Uninstall complete"
}


install_sun() {

	if [ "$MULTI_SERVER" = "false" ]; then 
	     STARTSCRIPT=coldfusion_$VERSION
	else
	     STARTSCRIPT=coldfusion$VERSIONmulti
	fi

	[ -f /etc/init.d/$STARTSCRIPT ] && {
		echo "ColdFusion $VERSION appears to already be set up to start on boot"
		exit 2
	}

	echo "Creating the ColdFusion $VERSION start script /etc/init.d/$STARTSCRIPT"
	if [ "$MULTI_SERVER" = "false" ]; then 
	   cp -f $CF_DIR/bin/sysinit /etc/init.d/$STARTSCRIPT
        else
	   cp -f $CF_DIR/bin/cf-multi-startup /etc/init.d/$STARTSCRIPT
        fi

	
	echo "Adding ColdFusion $VERSION start/kill links"
	ln -s /etc/init.d/$STARTSCRIPT /etc/rc3.d/S25$STARTSCRIPT
	ln -s /etc/init.d/$STARTSCRIPT /etc/rc1.d/K19$STARTSCRIPT

	echo "Install complete"
}

uninstall_sun() {
	if [ "$MULTI_SERVER" = "false" ]; then 
	     STARTSCRIPT=coldfusion_$VERSION
	else
	     STARTSCRIPT=coldfusion$VERSIONmulti
	fi

	[ -f /etc/init.d/$STARTSCRIPT ] || {
		echo "ColdFusion $VERSION does not appear to be added to your init system"
		exit 2
	}

	DIRPATH=/etc/rc3.d:/etc/rc1.d:/etc/init.d
	OLDIFS="$IFS"
	IFS=":"

	for DIR in $DIRPATH
	do
        		for RMFILE in `ls $DIR/*$STARTSCRIPT 2> /dev/null`
        		do
                		[ -f "$RMFILE" ] && {
				echo "Removing $RMFILE"
                        			rm -f $RMFILE
                		}
        		done
	done

	IFS="$OLDIFS"

	echo "Uninstall complete"
}

install_mac()
{
    if [ -f /Library/StartupItems/ColdFusion$VERSION ]; then
        echo "ColdFusion $VERSION appears to already be set up to start on boot"
        exit 2
    fi

    echo "Creating the ColdFusion ${VERSION} start script /Library/StartupItems/ColdFusion${VERSION}/ColdFusion${VERSION}"
    mkdir /Library/StartupItems/ColdFusion${VERSION} > /dev/null 2>&1 
    cp -f $CF_DIR/bin/cf-standalone-startup /Library/StartupItems/ColdFusion${VERSION}/ColdFusion${VERSION}

    touch /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    chmod 777 /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '{' > /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '    Description     = "ColdFusion '${VERSION}' Performance Monitoring Toolset";' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '    Provides        = ("ColdFusion '${VERSION}' Performance Monitoring Toolset");' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '    Requires        = ();' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '    OrderPreference = "None";' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '    Messages =' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '    {' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '        start = "Starting ColdFusion '${VERSION}' Performance Monitoring Toolset";' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '        stop  = "Stopping ColdFusion '${VERSION}' Performance Monitoring Toolset";' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '    };' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist
    echo '}' >> /Library/StartupItems/ColdFusion${VERSION}/StartupParameters.plist

    chmod 544 /Library/StartupItems/ColdFusion${VERSION}/*
    chown root:wheel /Library/StartupItems/ColdFusion${VERSION}/*

    mkdir /Library/LaunchDaemons > /dev/null 2>&1
    touch /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    chmod 777 /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '<?xml version="1.0" encoding="UTF-8"?>' > /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '<plist version="1.0">' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '<dict>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <key>Label</key>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <string>com.adobe.com.adobe.adobecoldfusion'${VERSION}'</string>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <key>Program</key>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <string>/Library/StartupItems/ColdFusion'${VERSION}'/ColdFusion'${VERSION}'</string>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <key>RunAtLoad</key>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <true/>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <key>KeepAlive</key>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '    <true/>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '</dict>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    echo '</plist>' >> /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    chmod 644 /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
    chown root:wheel /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist

    echo "Install complete"
}

uninstall_mac()
{
   if [ ! -d /Library/StartupItems/ColdFusion$VERSION ]; then
        echo "ColdFusion $VERSION does not appear to be added to your init system"
        exit 2
   fi

   rm -rf /Library/StartupItems/ColdFusion${VERSION}
   rm -rf /Library/LaunchDaemons/com.adobe.adobecoldfusion${VERSION}.plist
   echo "Uninstall complete"
}

case `uname` in

	SunOS)
		OS=Solaris
		INSTALL=install_sun
		UNINSTALL=uninstall_sun
		
	;;

        Linux)
            if [ -x "$(command -v systemctl)" ]; then
                INSTALL=install_linux_systemd
                UNINSTALL=uninstall_linux_systemd
            else
                INSTALL=install_linux
                UNINSTALL=uninstall_linux
		
                if [ -f /etc/redhat-release ]; then
                    OS=RedHat
                elif [ -f /etc/SuSE-release ]; then
                    OS=SuSE
                elif [ -f /etc/UnitedLinux-release ]; then
                    OS=SuSE
                else
                    OS=Linux
                fi
            fi
        ;;

	Darwin)
		INSTALL=install_mac
		UNINSTALL=uninstall_mac
	;;
	
	*)
	
	echo "Sorry, your OS: `uname` is unsupported for Init system configuration, skipping."
	exit 1
	;;

esac

ARG=$1

[ -z "$ARG" ] && ARG=usage

case $ARG in

	install)	
		$INSTALL
	;;

	uninstall)
		$UNINSTALL
	;;

	*)
		echo "Usage:$0 (install|uninstall)"
	;;

esac

exit 0
