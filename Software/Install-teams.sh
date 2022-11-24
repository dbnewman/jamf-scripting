#!/bin/sh
pkgfile="MicrosoftTeams.pkg"
logfile="/Library/Logs/MicrosoftTeamsInstallScript.log"
# https://macadmins.software/ has the links
url='https://go.microsoft.com/fwlink/?linkid=869428'

/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -L -s -o /tmp/${pkgfile} ${url}
/bin/echo "`date`: Downloaded ${pkgfile}." >> ${logfile}
/bin/echo "`date`: `du -h /tmp/${pkgfile}`" >> ${logfile}
/bin/echo "`date`: Installing..." >> ${logfile}
/usr/sbin/installer -pkg /tmp/${pkgfile} -target /
/bin/sleep 5
/bin/echo "`date`: Deleting package installer." >> ${logfile}
/bin/rm /tmp/"${pkgfile}"

exit 0