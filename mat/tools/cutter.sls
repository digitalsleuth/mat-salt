# Name: Cutter
# Website: https://cutter.re
# Description: Reverse engineering platform powered by radare2
# Category: 
# Author: 
# License: GNU General Public License (GPL) v3.0: https://github.com/radareorg/cutter/blob/master/COPYING
# Notes:

mat-tools-cutter:
  file.managed:
    - name: /usr/local/bin/cutter
    - source: https://github.com/radareorg/cutter/releases/download/v1.11.1/Cutter-v1.11.1-x64.Linux.AppImage
    - source_hash: sha256=13912a5e104ad33dc73c1ea1beaffd80055b41b475c6dbdffaa16a050aa929c0
    - mode: 755

