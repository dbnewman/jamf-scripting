#!/bin/sh

loom_version=$(curl -s https://s3-us-west-2.amazonaws.com/loom.desktop.packages/loom-inc-production/desktop-packages/latest-mac.yml |  head -1 | cut -f2 -d ' ')
url="https://cdn.loom.com/desktop-packages/Loom-$loom_version.dmg"

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
    /usr/bin/hdiutil unmount "$volume"
    /bin/rm -rf $tempd
    set +x
}

installdmg "${url}"