# Name: DatCon
# Website: http://datfile.net
# Description:
# Category:
# Author: 
# License: 
# Notes: datcon

include:
  - mat.apt-packages.default-jre

mat-tools-datcon-source:
  file.managed:
    - name: /usr/local/src/mat/files/datcon.4.0.5.zip
    - source: http://datfile.net/DatCon/DatCon.4.0.5.zip
    - source_hash: sha256=34280b8af63fa2f496c999404880d35472ab0efbd3510eb4e99483d2e0a37258
    - makedirs: True

mat-tools-datcon-archive:
  archive.extracted:
    - name: /usr/local/src/mat/datcon
    - source: /usr/local/src/mat/files/datcon.4.0.5.zip
    - enforce_toplevel: False
    - watch:
      - file: mat-tools-datcon-source

mat-tools-datcon-wrapper:
  file.managed:
    - name: /usr/local/bin/datcon
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/mat/datcon/DatCon.4.0.5.jar ${*}
    - watch:
      - archive: mat-tools-datcon-archive

