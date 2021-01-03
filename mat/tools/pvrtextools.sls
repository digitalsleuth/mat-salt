# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

{% set filename="PVRTexToolSetup-2020_R1.run-x64" %}

include:
  - mat.apt-packages.libgl1-mesa-dev
  - mat.apt-packages.libgtk2-dev

apt-update:
  pkg.uptodate:
    - refresh: True

mat-tools-pvrtextools:
  file.managed:
    - name: /usr/local/src/mat/files/{{ filename }}
    - source: http://cdn.imgtec.com/sdk/OFFLINE/{{ filename }}
    - source_hash: sha256=15157f4c85e123f024669c73df53688f5779c3b5dea1cefd7635574a3b85dd1f
    - makedirs: True
    - mode: 755

mat-tools-pvrtextools-install:
  cmd.run:
    - name: /usr/local/src/mat/files/{{ filename }} --mode unattended --prefix /usr/local/src
    - require:
      - sls: mat.apt-packages.libgl1-mesa-dev
      - sls: mat.apt-packages.libgtk2-dev
      - file: mat-tools-pvrtextools

mat-tools-pvrtextools-wrapper:
  file.managed:
    - name: /usr/local/bin/pvrtextools  
    - mode: 755
    - watch:
      - cmd: mat-tools-pvrtextools-install
    - contents:
      - '#!/bin/bash'
      - /usr/local/src/PVRTexTool/CLI/Linux_x86_64/PVRTexToolCLI ${*}

mat-tools-pvrtextools-gui-wrapper:
  file.managed:
    - name: /usr/local/bin/pvrtextools_gui
    - mode: 755
    - watch:
      - cmd: mat-tools-pvrtextools-install
    - contents:
      - '#!/bin/bash'
      - /usr/local/src/PVRTexTool/GUI/Linux_x86_64/PVRTexToolGUI ${*}
