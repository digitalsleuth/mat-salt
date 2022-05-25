# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

{% set version = "9.37.3" -%}
{% set hash = "b7da2d21842397ce095b9199305ef47dfa73505330dfa49fb8c7d146e5c8a6f6" -%}

include:
  - mat.apt-packages.firefox

mat-tools-cyberchef:
  archive.extracted:
    - name: /usr/local/cyberchef
    - enforce_toplevel: False
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version}}/CyberChef_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - require:
      - sls: mat.apt-packages.firefox

mat-tools-cyberchef-wrapper:
  file.managed:
    - name: /usr/local/bin/cyberchef
    - mode: 755
    - watch:
      - archive: mat-tools-cyberchef
    - contents:
      - '#!/bin/bash'
      - firefox /usr/local/cyberchef/CyberChef_v{{ version }}.html &
