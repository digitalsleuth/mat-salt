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
    - name: /usr/local/src/radare2-ubuntu-1804_4.5.0_amd64.deb
    - source: https://github.com/radareorg/radare2/releases/download/4.5.0/radare2-ubuntu-1804_4.5.0_amd64.deb
    - source_hash: sha256=648dd1478727ee8250504a66ed60fcbe4371cdc2b5c07100834c453e5deb2504

mat-radare2:
  pkg.installed:
    - sources:
      - radare2: /usr/local/src/radare2-ubuntu-1804_4.5.0_amd64.deb
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
    - name: /usr/local/src/radare2-ubuntu-1804_4.5.0_amd64.deb
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


