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
    - source: https://github.com/rizinorg/cutter/releases/download/v2.0.5/Cutter-v2.0.5-x64.Linux.AppImage
    - source_hash: sha256=453b0d1247f0eab0b87d903ce4995ff54216584c5fd5480be82da7b71eb2ed3d
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
