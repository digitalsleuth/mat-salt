# Name:
# Website:
# Description:
# Category:
# Author:
# License:
# Notes:

mat-tools-genymotion-source:
  file.managed:
    - name: /usr/local/src/mat/files/genymotion-3.1.2-linux_x64.bin
    - source: https://dl.genymotion.com/releases/genymotion-3.1.2/genymotion-3.1.2-linux_x64.bin
    - source_hash: sha256=41e9b4486a73468ecefbf7aa9a63292281c69cb45fe0cb193d290b2b921d0433
    - mode: 755
    - makedirs: True

mat-tools-genymotion-install:
  cmd.run:
    - name: /usr/local/src/mat/files/genymotion-3.1.2-linux_x64.bin -y --destination /usr/local/src/
    - require:
      - file: mat-tools-genymotion-source

mat-tools-genyshell-symlink:
  file.symlink:
    - name: /usr/local/bin/genyshell
    - target: /usr/local/src/genymotion/genyshell
    - mode: 755
    - require:
      - cmd: mat-tools-genymotion-install

mat-tools-genymotion-symlink:
  file.symlink:
    - name: /usr/local/bin/genymotion
    - target: /usr/local/src/genymotion/genymotion
    - mode: 755
    - require:
      - cmd: mat-tools-genymotion-install

mat-tools-gmtool-symlink:
  file.symlink:
    - name: /usr/local/bin/gmtool
    - target: /usr/local/src/genymotion/gmtool
    - mode: 755
    - require:
      - cmd: mat-tools-genymotion-install
