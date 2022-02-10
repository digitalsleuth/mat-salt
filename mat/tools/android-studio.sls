{% set prev_version="android-studio-ide-201.6953283-linux.tar.gz" %}
{% set curr_version="android-studio-2021.1.1.21-linux.tar.gz" %}
{% set hash = "3de3092082df6ae9d3969478115efaa909539590dc5a829eb3ad6a7bd5bda2a4" %}
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
    - source: https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.21/{{ curr_version }}
    - source_hash: sha256={{ hash }}
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
