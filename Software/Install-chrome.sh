#!/bin/sh
pkgfile="GoogleChrome.pkg"
logfile="/Library/Logs/GoogleChromeInstallScript.log"
url='https://dl.google.com/chrome/mac/stable/gcem/GoogleChrome.pkg'
enrollmenttoken="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"

/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -s -o /tmp/${pkgfile} ${url}
/bin/echo "`date`: Installing..." >> ${logfile}
cd /tmp
/usr/sbin/installer -pkg GoogleChrome.pkg -target /
/bin/sleep 5
/bin/echo "`date`: Deleting package installer." >> ${logfile}
/bin/rm /tmp/"${pkgfile}"

# Enroll in chrome management
mkdir -p /Library/Google/Chrome && echo $enrollmenttoken > /Library/Google/Chrome/CloudManagementEnrollmentToken

exit 0