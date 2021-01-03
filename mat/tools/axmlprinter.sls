# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.default-jre

mat-tools-axmlprinter-source:
  file.managed:
    - name: /usr/local/src/axmlprinter/axmlprinter.jar
    - source: https://github.com/rednaga/axmlprinter/releases/download/0.1.7/axmlprinter-0.1.7.jar
    - source_hash: f0f9b3f1725bc2409cbfb1c847208534e821859fbb2922d11e4e904c5962c550
    - makedirs: True
    - mode: 755

mat-tools-axmlprinter-wrapper:
  file.managed:
    - name: /usr/local/bin/axmlprinter
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/axmlprinter/axmlprinter.jar ${*}
    - require:
      - sls: mat.apt-packages.default-jre
