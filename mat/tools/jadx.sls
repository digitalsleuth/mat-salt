{% set prev_version="jadx-1.1.0.zip" %}
{% set curr_version="jadx-1.2.0.zip" %} 
# Name: JADX
# Website: https://github.com/skylot/jadx
# Description: Generate Java source code from Dalvik Executable (dex) and Android APK files
# Category: 
# Author: Skylot
# License: Apache License 2.0: (https://github.com/skylot/jadx/blob/master/LICENSE) (https://github.com/skylot/jadx/blob/master/NOTICE)
# Notes: jadx, jadx-gui

include:
  - mat.apt-packages.default-jdk

mat-tools-jadx-source:
  file.managed:
    - name: /usr/local/src/mat/files/{{ curr_version }}
    - source: https://github.com/skylot/jadx/releases/download/v1.2.0/{{ curr_version }}
    - source_hash: sha256=e6ae92be16edae2098b1a9951533feba4278bb18f00fbab54eb23a427b98d425
    - makedirs: true
    - require:
      - sls: mat.apt-packages.default-jdk

mat-tools-jadx-archive:
  archive.extracted:
    - name: /usr/local/jadx
    - source: /usr/local/src/mat/files/{{ curr_version }}
    - enforce_toplevel: false
    - watch:
      - file: mat-tools-jadx-source

mat-tools-jadx-link1:
  file.symlink:
    - target: /usr/local/jadx/bin/jadx
    - name: /usr/local/bin/jadx
    - mode: 755
    - watch:
      - archive: mat-tools-jadx-archive

mat-tools-jadx-link2:
  file.symlink:
    - target: /usr/local/jadx/bin/jadx-gui
    - name: /usr/local/bin/jadx-gui
    - mode: 755
    - watch:
      - archive: mat-tools-jadx-archive

mat-tools-jadx-upgrade-cleanup:
  file.absent:
    - name: /usr/local/src/mat/files/{{ prev_version }}
    - watch:
      - file: mat-tools-jadx-link2
