# Name: CsvView
# Website: http://datfile.net
# Description:
# Category:
# Author: 
# License: 
# Notes: csvview, extractdji

include:
  - mat.apt-packages.default-jre

mat-tools-csvview-source:
  file.managed:
    - name: /usr/local/src/mat/files/csvviewmac.4.0.5.zip
    - source: http://datfile.net/CsvView/CsvViewMac.4.0.5.zip
    - source_hash: sha256=abbbc0f13d67683d9ffea7b02df32699c01e6670cb1cd1ef4ee583f589d94ee9
    - makedirs: True

mat-tools-csvview-archive:
  archive.extracted:
    - name: /usr/local/src/mat/csvview
    - source: /usr/local/src/mat/files/csvviewmac.4.0.5.zip
    - enforce_toplevel: False
    - watch:
      - file: mat-tools-csvview-source

mat-tools-csvview-wrapper:
  file.managed:
    - name: /usr/local/bin/csvview
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/mat/csvview/CsvView.4.0.5.jar ${*}
    - watch: 
      - archive: mat-tools-csvview-archive

mat-tools-csvview-extractdji-wrapper:
  file.managed:
    - name: /usr/local/bin/extractdji
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/mat/csvview/ExtractDJI.jar ${*}
    - watch:
      - archive: mat-tools-csvview-archive
