# Name: radare2
# Website: https://www.radare.org/n/radare2.html
# Description: Examine binary files, including disassembling and debugging.
# Category: 
# Author: https://github.com/radareorg/radare2/blob/master/AUTHORS.md
# License: GNU Lesser General Public License (LGPL) v3 (https://github.com/radareorg/radare2/blob/master/COPYING)
# Notes: r2, rasm2, rabin2, rahash2, rafind2

include:
  - mat.apt-packages.git

mat-radare2-source:
  file.managed:
    - name: /usr/local/src/radare2_5.5.4_amd64.deb
    - source: https://github.com/radareorg/radare2/releases/download/5.5.4/radare2_5.5.4_amd64.deb
    - source_hash: sha256=4e8cbd37ac81b0c6baeaa1e013fa01ef94d45105f45f98fa68b20fd2d8f339ad

mat-radare2:
  pkg.installed:
    - sources:
      - radare2: /usr/local/src/radare2_5.5.4_amd64.deb
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
    - name: /usr/local/src/radare2_5.5.4_amd64.deb
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


