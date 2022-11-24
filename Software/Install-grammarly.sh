#!/bin/sh

url='https://download-mac.grammarly.com/Grammarly.dmg'

function installdmg {
    set -x
    tempd=$(/usr/bin/mktemp -d)
    /usr/bin/curl $1 > $tempd/pkg.dmg
    listing=$(/usr/bin/hdiutil attach $tempd/pkg.dmg | /usr/bin/grep Volumes)
    volume=$(echo "$listing" | /usr/bin/cut -f 3)
    if [ -e "$volume"/*.app ]; then
      /bin/cp -rf "$volume"/*.app /Applications
    elif [ -e "$volume"/*.pkg ]; then
      package=$(ls -1 "$volume" | grep .pkg | /usr/bin/head -1)
      /usr/sbin/installer -pkg "$volume"/"$package" -target /
    fi
    /usr/bin/hdiutil detach "$(echo "$listing" | cut -f 1)"
    /bin/rm -rf $tempd
    set +x
}

installdmg "${url}"