# Name: apktool
# Website: https://bitbucket.org/iBotPeaches/apktool
# Description: A tool for reverse engineering APK files
# Category: Android
# Author: Connor Tumbleson
# License: Apache License 2.0 (https://github.com/iBotPeaches/Apktool/blob/master/LICENSE.md)
# Notes: apktool

include:
  - mat.apt-packages.default-jre

mat-tools-apktool-source:
  file.managed:
    - name: /usr/local/apktool/apktool_2.6.0.jar
    - source: https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.6.0.jar
    - source_hash: sha256=f750a3cd2c1f942f27f5f7fd5d17eada3bdaff0a6643f49db847e842579fdda5
    - mode: 755
    - makedirs: True

mat-tools-apktool-wrapper:
  file.managed:
    - name: /usr/local/bin/apktool
    - mode: 755
    - watch:
      - file: mat-tools-apktool-source
    - require:
      - sls: mat.apt-packages.default-jre
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/apktool/apktool_2.6.0.jar ${*}

