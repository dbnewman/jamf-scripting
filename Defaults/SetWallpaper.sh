#!/bin/sh

# Wallpaper path
wallpaper_url="https://path.to/wallpaper.jpg"


# Get the currently logged in user
current_user=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
uid=$(id -u "$current_user")

# Check if desktoppr package exists, if not install it
if ! [ -x "$(command -v desktoppr)" ]; then

  url="https://github.com/scriptingosx/desktoppr/releases/download/v0.4/desktoppr-0.4.pkg"
  curl -L "$url" > /tmp/desktoppr.pkg
  installer -pkg /tmp/desktoppr.pkg -target /
  rm -rf /tmp/desktoppr.pkg

fi

# Get the latest version of the wallpaper
picture_path='/usr/local/wallpaper.jpg'
/usr/bin/curl $wallpaper_url > $picture_path

# Set wallpaper as user
launchctl asuser "$uid" sudo -u "$current_user" desktoppr "$picture_path"
