# Name: radare2
# Website: https://www.radare.org/n/radare2.html
# Description: Examine binary files, including disassembling and debugging.
# Category: 
# Author: https://github.com/radareorg/radare2/blob/master/AUTHORS.md
# License: GNU Lesser General Public License v3.0 (https://github.com/radareorg/radare2/blob/master/COPYING)
# Version: 5.6.8
# Notes: r2, rasm2, rabin2, rahash2, rafind2

{% set version = '5.6.8' %}
{% set hash = '7af2fa605f00e1ae740db7dba2c0b8bc6c44e2eea3027cc7795ec46bf0292d2e' %}

include:
  - mat.apt-packages.git

mat-radare2-source:
  file.managed:
    - name: /usr/local/src/radare2_{{ version }}_amd64.deb
    - source: https://github.com/radareorg/radare2/releases/download/{{ version }}/radare2_{{ version }}_amd64.deb
    - source_hash: sha256={{ hash }}

mat-radare2:
  pkg.installed:
    - sources:
      - radare2: /usr/local/src/radare2_{{ version }}_amd64.deb
    - watch:
      - file: mat-radare2-source
    - require:
      - pkg: git

mat-radare2-cleanup:
  pkg.removed:
    - name: libradare2-common
    - require:
      - pkg: mat-radare2

mat-radare2-cleanup-deb:
  file.absent:
    - name: /usr/local/src/radare2_{{ version }}_amd64.deb
    - watch:
      - pkg: mat-radare2

mat-radare2-init:
  cmd.wait:
    - name: r2pm init
    - watch:
      - pkg: mat-radare2-cleanup

mat-radare2-update:
  cmd.wait:
    - name: r2pm update
    - watch:
      - cmd: mat-radare2-init
