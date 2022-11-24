#!/bin/zsh
# use zsh instead of bash 06/2022
echo "Status: Setting computer name" >> /var/tmp/depnotify.log
/usr/local/bin/jamf setComputerName -useSerialNumber

# Set basic variables
#osversion=$(sw_vers -productVersion)
#serial=$(ioreg -rd1 -c IOPlatformExpertDevice | awk -F'"' '/IOPlatformSerialNumber/{print $4}')
#jamf setComputerName -name "${serial}"

# Wait a few seconds
sleep 5

exit 0