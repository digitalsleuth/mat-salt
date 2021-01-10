# Name: Cutter
# Website: https://cutter.re
# Description: Reverse engineering platform powered by radare2
# Category: 
# Author: https://github.com/rizinorg/cutter/graphs/contributors
# License: GNU General Public License (GPL) v3.0: https://github.com/rizinorg/cutter/blob/master/COPYING
# Notes:

mat-tools-cutter:
  file.managed:
    - name: /usr/local/bin/cutter
    - source: https://github.com/rizinorg/cutter/releases/download/v1.12.0/Cutter-v1.12.0-x64.Linux.AppImage
    - source_hash: sha256=73a0bb63d0b8b6cd2c45c98280f6753a394b061797b5a8bf125bb3d15bbca1b4
    - mode: 755

#mat-tools-cutter-icon:
#  file.managed:
#    - name: /usr/share/icons/cutter.svg
#    - source: https://raw.githubusercontent.com/rizinorg/cutter/v1.12.0/src/img/cutter.svg
#    - source_hash: sha256=4ad117f6d8fc9fffc1359d1eef7f3f1c68db0f74eebebc998fa47b89bab81832
#    - mode: 644
#    - makedirs: True
#    - watch:
#      - file: mat-tools-cutter
