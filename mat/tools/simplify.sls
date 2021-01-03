# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.default-jdk

mat-tools-simplify-simplify-jar:
  file.managed:
    - name: /usr/local/src/simplify/simplify-1.3.0.jar
    - source: https://github.com/CalebFenton/simplify/releases/download/v1.3.0/simplify-1.3.0.jar
    - source_hash: sha256=f346d6dd064a212cea3d6cd9a22aa78ad9e81f664d2f216551467e59c52d3d31
    - makedirs: True
    - mode: 755

mat-tools-simplify-smalivm-jar:
  file.managed:
    - name: /usr/local/src/simplify/smalivm-1.3.0.jar
    - source: https://github.com/CalebFenton/simplify/releases/download/v1.3.0/smalivm-1.3.0.jar
    - source_hash: sha256=c9c4d245771ee277d11e645364a1a72c9814c772157293189419b53ccda0bf87
    - makedirs: True
    - mode: 755

mat-tools-simplify-sdbg-jar:
  file.managed:
    - name: /usr/local/src/simplify/sdbg-0.1.0.jar
    - source: https://github.com/CalebFenton/simplify/releases/download/v1.3.0/sdbg-0.1.0.jar
    - source_hash: sha256=8b44beb2591d24fc63be20df2efd760084d656d21e1b493d4a3f3d0bc8d43c52
    - makedirs: True
    - mode: 755

mat-tools-simplify-simplify-wrapper:
  file.managed:
    - name: /usr/local/bin/simplify
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/simplify/simplify-1.3.0.jar ${*}
    - mode: 755
    - require:
      - file: mat-tools-simplify-simplify-jar
      - sls: mat.apt-packages.default-jdk

mat-tools-simplify-smalivm-wrapper:
  file.managed:
    - name: /usr/local/bin/smalivm
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/simplify/smalivm-1.3.0.jar ${*}
    - mode: 755
    - require:
      - file: mat-tools-simplify-smalivm-jar
      - sls: mat.apt-packages.default-jdk

mat-tools-simplify-sdbg-wrapper:
  file.managed:
    - name: /usr/local/bin/sdbg
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/simplify/sdbg-0.1.0.jar ${*}
    - mode: 755
    - require:
      - file: mat-tools-simplify-sdbg-jar
      - sls: mat.apt-packages.default-jdk
