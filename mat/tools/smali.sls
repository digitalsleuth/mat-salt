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
    - name: /opt/smali/smali-2.4.0.jar
    - source: https://bitbucket.org/JesusFreke/smali/downloads/smali-2.4.0.jar
    - source_hash: sha256=cdbbae7d358374f955e8e3db89390db039cc3f6668e4ea002d9a14af9c87a0d9
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
      - java -jar /opt/smali/smali-2.4.0.jar ${*}
    - watch:
      - file: mat-tools-smali-source

