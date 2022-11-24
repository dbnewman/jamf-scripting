#!/bin/sh
#
# Script Name: Dock Configuration
# Script Purpose: Installs the dockutil cmdlet, removes the default dock items
#                 adds the ones most utilised by us, and reloads the dock.
#

# Check if dockutil package exists, if not install it
if ! [ -x "$(command -v dockutil)" ]; then

  url="https://github.com/kcrawford/dockutil/releases/download/3.0.2/dockutil-3.0.2.pkg"
  curl -L "$url" > /tmp/dockutil.pkg
  installer -pkg /tmp/dockutil.pkg -target /
  rm -rf /tmp/dockutil.pkg

fi

# Get current user
user=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

# Remove default items
sudo dockutil --remove 'Safari' --no-restart "/Users/$user"
sudo dockutil --remove 'Mail' --no-restart  "/Users/$user"
sudo dockutil --remove 'Launchpad' --no-restart  "/Users/$user"
sudo dockutil --remove 'Maps' --no-restart  "/Users/$user"
sudo dockutil --remove 'Reminders' --no-restart  "/Users/$user"
sudo dockutil --remove 'iBooks' --no-restart  "/Users/$user"
sudo dockutil --remove 'FaceTime' --no-restart  "/Users/$user"
sudo dockutil --remove 'App Store' --no-restart  "/Users/$user"
sudo dockutil --remove 'iTunes' --no-restart  "/Users/$user"
sudo dockutil --remove 'Messages' --no-restart  "/Users/$user"
sudo dockutil --remove 'Contacts' --no-restart  "/Users/$user"
sudo dockutil --remove 'Photos' --no-restart  "/Users/$user"
sudo dockutil --remove 'Calendar' --no-restart  "/Users/$user"
sudo dockutil --remove 'Notes' --no-restart  "/Users/$user"
sudo dockutil --remove 'Podcasts' --no-restart  "/Users/$user"
sudo dockutil --remove 'TV' --no-restart  "/Users/$user"
sudo dockutil --remove 'Music' --no-restart  "/Users/$user"
sudo dockutil --remove 'News' --no-restart  "/Users/$user"
sudo dockutil --remove 'Numbers' --no-restart  "/Users/$user"
sudo dockutil --remove 'Keynote' --no-restart  "/Users/$user"
sudo dockutil --remove 'Pages' --no-restart  "/Users/$user"
sudo dockutil --remove 'System Preferences' --no-restart  "/Users/$user"

# Add business applications
sudo dockutil --add '/Applications/Google Chrome.app' --no-restart "/Users/$user"
sudo dockutil --add '/Applications/Microsoft Word.app' --after 'Google Chrome' --no-restart  "/Users/$user"
sudo dockutil --add '/Applications/Microsoft Excel.app' --after 'Microsoft Word' --no-restart  "/Users/$user"
sudo dockutil --add '/Applications/Microsoft PowerPoint.app' --after 'Microsoft Excel' --no-restart  "/Users/$user"
sudo dockutil --add '/Applications/Microsoft Outlook.app' --after 'Microsoft Powerpoint' --no-restart  "/Users/$user"
sudo dockutil --add '/Applications/Microsoft Teams.app' --after 'Microsoft Outlook' --no-restart  "/Users/$user"
sudo dockutil --add '/Applications/OneDrive.app' --after 'Filemaker Pro.app' --no-restart "/Users/$user"
sudo dockutil --add '/Applications/Self Service.app' --after 'OneDrive' --no-restart "/Users/$user"

killall cfprefsd
killall Dock