# Name: cfr
# Website: https://www.benf.org/other/cfr/
# Description: Java decompiler
# Category:
# Author: Lee Benfield
# License: MIT License (https://github.com/leibnitz27/cfr/blob/master/LICENSE)
# Notes: 

{% set prev_version="None" %}
{% set curr_version="cfr-0.150.jar" %}

include:
  - mat.apt-packages.default-jre

mat-tools-cfr-directory:
  file.directory:
    - name: /usr/local/cfr/
    - user: root
    - group: root
    - mode: 755
    - makedirs: true

mat-tools-cfr-source:
  file.managed:
    - name: /usr/local/cfr/{{ curr_version }}
    - source: https://github.com/leibnitz27/cfr/releases/download/0.150/{{ curr_version }}
    - source_hash: sha256=d2755995ba1f3994d71d1905544b250c49ac6529433eb4383923430b6f109826
    - mode: 755
    - watch:
      - file: mat-tools-cfr-directory
    - require:
      - file: mat-tools-cfr-directory

mat-tools-cfr-wrapper:
  file.managed:
    - name: /usr/local/bin/cfr
    - mode: 755
    - watch:
      - file: mat-tools-cfr-source
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/cfr/{{ curr_version }} ${*}

mat-tools-cfr-cleanup:
  file.absent:
    - name: /usr/local/cfr/{{ prev_version }}
    - watch:
      - file: mat-tools-cfr-wrapper
