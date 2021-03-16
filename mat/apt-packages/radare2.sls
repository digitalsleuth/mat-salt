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
    - name: /usr/local/src/radare2_5.1.1_amd64.deb
    - source: https://github.com/radareorg/radare2/releases/download/5.1.1/radare2_5.1.1_amd64.deb
    - source_hash: sha256=67b94af19c7df3a8cb46ec86546b2b06508f9c16d6007e0e4f77555a6b057331

mat-radare2:
  pkg.installed:
    - sources:
      - radare2: /usr/local/src/radare2_5.1.1_amd64.deb
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
    - name: /usr/local/src/radare2_5.1.1_amd64.deb
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


