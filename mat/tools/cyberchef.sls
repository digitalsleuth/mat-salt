# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

{% set version = "9.32.3" -%}
{% set hash = "465cf64bdd80cf99be72bedc9dccf7fcebaeace58d77ec62d71733c3e2ba404f" -%}

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
