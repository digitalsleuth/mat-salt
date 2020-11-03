# Name: bytecode-viewer
# Website: https://github.com/Konloch/bytecode-viewer
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.default-jre

mat-tools-bytecode-viewer-source:
  file.managed:
    - name: /usr/local/bytecode-viewer/Bytecode-Viewer-2.9.22.jar
    - source: https://github.com/Konloch/bytecode-viewer/releases/download/v2.9.22/Bytecode-Viewer-2.9.22.jar
    - source_hash: sha256=5d93188857302584a8f53e8eb1177910410896e71e23d82859a4869fc2c57532
    - mode: 755
    - makedirs: True
    - require:
      - sls: mat.apt-packages.default-jre

mat-tools-bytecode-viewer-wrapper:
  file.managed:
    - name: /usr/local/bin/bytecode-viewer
    - mode: 755
    - watch:
      - file: mat-tools-bytecode-viewer-source
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/bytecode-viewer/Bytecode-Viewer-2.9.22.jar ${*}
