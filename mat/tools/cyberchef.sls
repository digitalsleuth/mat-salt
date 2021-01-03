# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

{% set version = "9.21.0" -%}
{% set hash = "5a53c4e0bee1303ef73210a6e2fbb3f5151d4ad09cc3681581c6c35b15584126" -%}

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
