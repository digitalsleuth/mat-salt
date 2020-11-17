# Name:
# Website:
# Description:
# Category:
# Author:
# License: 
# Notes:

include:
  - mat.tools.android-ndk

mat-tools-android-studio-source:
  file.managed:  
    - name: /usr/local/src/mat/files/android-studio-ide-193.6626763-linux.tar.gz
    - source: https://r2---sn-qpnugpc0uxa-tu1l.gvt1.com/edgedl/android/studio/ide-zips/4.0.1.0/android-studio-ide-193.6626763-linux.tar.gz
    - source_hash: sha256=f2f82744e735eae43fa018a77254c398a3bab5371f09973a37483014b73b7597
    - makedirs: True

mat-tools-android-studio-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/android-studio-ide-193.6626763-linux.tar.gz
    - enforce_toplevel: True
    - watch:
      - file: mat-tools-android-studio-source
    - require:
      - sls: mat.tools.android-ndk

mat-tools-android-studio-wrapper:
  file.managed:
    - name: /usr/local/bin/studio.sh
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - bash /usr/local/android-studio/bin/studio.sh ${*} 
    - watch:
      - archive: mat-tools-android-studio-archive
