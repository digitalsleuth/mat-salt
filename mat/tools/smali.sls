# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.default-jre

mat-tools-smali-source:
  file.managed:
    - name: /opt/smali/smali-2.5.2.jar
    - source: https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.2.jar
    - source_hash: sha256=9544299578b16f771d8aa8eaefe0d3718ca03478c16f3c356f2fcf1366bfb116
    - mode: 755
    - makedirs: True
    - require:
      - sls: mat.apt-packages.default-jre

mat-tools-smali-wrapper:
  file.managed:
    - name: /usr/local/bin/smali
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - java -jar /opt/smali/smali-2.5.2.jar ${*}
    - watch:
      - file: mat-tools-smali-source

