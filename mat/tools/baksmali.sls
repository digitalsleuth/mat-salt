# Name: baksmali
# Website: https://bitbucket.org/JesusFreke/smali
# Description: Disassembler for the dex format used by Dalvik, Android's Java VM implementation.
# Category: 
# Author: Ben Gruver
# License: Apache License 2.0 (https://bitbucket.org/JesusFreke/smali/src/master/NOTICE)
# Notes: baksmali

include:
  - mat.apt-packages.default-jre

mat-tools-baksmali:
  file.managed:
    - name: /opt/baksmali/baksmali-2.5.2.jar
    - source: https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.2.jar
    - source_hash: sha256=d3116248cce4f82ec5a31eb7f95ee75daff42ddf6eed0ab573973dc53fbad2e5
    - mode: 755
    - makedirs: True
    - require:
      - sls: mat.apt-packages.default-jre

mat-tools-baksmali-wrapper:
  file.managed:
    - name: /usr/local/bin/baksmali
    - mode: 755
    - watch:
      - file: mat-tools-baksmali
    - contents:
      - '#!/bin/bash'
      - java -jar /opt/baksmali/baksmali-2.5.2.jar ${*}
