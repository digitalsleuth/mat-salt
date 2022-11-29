# Name: android_triage
# Website: https://github.com/RealityNet/android_triage
# Description: Bash script to triage an Android device
# Category: Android
# Author: Mattia Epifani && Giovanni Rattaro
# License: GNU GPLv3 (https://github.com/RealityNet/android_triage/blob/main/android_triage.sh)
# Notes: android_triage.sh

include:
  - mat.apt-packages.android-tools-adb

mat-scripts-android-triage:
  file.managed:
    - name: /usr/local/bin/android_triage.sh
    - source: https://github.com/RealityNet/android_triage/raw/main/android_triage.sh
    - source_hash: sha256=95bb051fbbd59c4ca479922243e74d41840a683e82062f8f73c841f936292145
    - mode: 755
    - require:
      - sls: mat.apt-packages.android-tools-adb


