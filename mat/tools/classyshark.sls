# Name: classyshark
# Website: https://github.com/google/android-classyshark
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.default-jre

mat-tools-classyshark-source:
  file.managed:
    - name: /usr/local/classyshark/classyshark.jar
    - source: https://github.com/google/android-classyshark/releases/download/8.2/ClassyShark.jar
    - source_hash: sha256=b3bd94ce2177f2423183070c3dd096cb9b695a70e8e04d8d7d3cca530d9b855d
    - mode: 755
    - makedirs: True
    - require:
      - sls: mat.apt-packages.default-jre

mat-tools-classyshark-wrapper:
  file.managed:
    - name: /usr/local/bin/classyshark
    - mode: 755
    - watch:
      - file: mat-tools-classyshark-source
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/classyshark/classyshark.jar ${*}
