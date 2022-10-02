# Name: android-tools-adb
# Website: https://developer.android.com/studio/command-line/adb
# Description: Android Debug Bridge allowing command-line communication with a device
# Category:
# Author: Google
# License: Google Custom License (https://developer.android.com/studio/terms)
# Notes: adb

{% if grains['oscodename'] == 'focal' %}

android-tools-adb:
  pkg.installed

adb:
  pkg.installed

{% elif grains['oscodename'] == 'jammy' %}

adb:
  pkg.installed

{% endif %}
