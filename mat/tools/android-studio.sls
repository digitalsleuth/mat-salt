{% set prev_version="None" %}
{% set curr_version="android-studio-ide-201.6953283-linux.tar.gz" %}
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
    - name: /usr/local/src/mat/files/{{ curr_version }}
    - source: https://r4---sn-tt1eln7l.gvt1.com/edgedl/android/studio/ide-zips/4.1.1.0/{{ curr_version }}
    - source_hash: sha256=68032184959c54576f119b7c7c8ded175d848374f3954fa450530d78260dd68b
    - makedirs: True

mat-tools-android-studio-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/{{ curr_version }}
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

mat-tools-android-studio-upgrade-cleanup:
  file.absent:
    - name: /usr/local/src/mat/files/{{ prev_version }}
    - watch:
      - file: mat-tools-android-studio-wrapper
