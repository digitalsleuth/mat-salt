# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.default-jre

mat-tools-axmlprinter2-source:
  file.managed:
    - name: /usr/local/axmlprinter2/axmlprinter2.jar
    - source: https://github.com/digitalsleuth/AXMLPrinter2/raw/main/AXMLPrinter2.jar
    - source_hash: sha256=00ed038eb6abaf6ddec8d202a3ed7a81b521458f4cd459948115cfd02ff59d6d
    - mode: 755
    - makedirs: True

mat-tools-axmlprinter2-wrapper:
  file.managed:
    - name: /usr/local/bin/axmlprinter2
    - mode: 755
    - watch:
      - file: mat-tools-axmlprinter2-source
    - require:
      - sls: mat.apt-packages.default-jre
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/axmlprinter2/axmlprinter2.jar ${*}


