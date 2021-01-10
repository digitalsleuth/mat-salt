# Name: Java ADB Remote Screen
# Website: https://github.com/MajeurAndroid/java-adb-remote-screen
# Description: Control Android phone from PC using ADB
# Category:
# Author: MajeurAndroid
# License: Apache License 2.0 (https://github.com/MajeurAndroid/java-adb-remote-screen#license)
# Notes: java-adb-remote-screen

include:
  - mat.apt-packages.default-jre

mat-tools-remote-screen-source:
  file.managed:
    - name: /usr/local/remote-screen/AdbRemoteScreen-3.0.jar
    - source: https://github.com/MajeurAndroid/Java-Adb-Remote-Screen/releases/download/3.0/AdbRemoteScreen-3.0.jar
    - source_hash: sha256=3cc8ddfcf05ea9b608f94944ab93e34cc8afe976995cc90280a33953ac03bff7
    - mode: 755
    - makedirs: True

mat-tools-remote-screen-wrapper:
  file.managed:
    - name: /usr/local/bin/java-adb-remote-screen
    - mode: 755
    - watch:
      - file: mat-tools-remote-screen-source
    - require:
      - sls: mat.apt-packages.default-jre
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/remote-screen/AdbRemoteScreen-3.0.jar ${*}
