#!/bin/bash

# Workaround as shown in https://www.jamf.com/jamf-nation/discussions/19050/add-wifi-networks-without-admin-privileges
# Allows non-admin users to manage their WiFi configuration.

#For WiFi

/usr/bin/security authorizationdb write system.preferences.network allow
/usr/bin/security authorizationdb write system.services.systemconfiguration.network allow
/usr/bin/security authorizationdb write com.apple.wifi allow
