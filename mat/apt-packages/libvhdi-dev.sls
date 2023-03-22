# Name: libvhdi-dev
# Website: https://github.com/libyal/libvhdi
# Description: Library and tools to access the Virtual Hard Disk image format
# Category: Image Utilities
# Author: Joachim Metz
# License: GNU General Public License v3.0 and Lesser (https://github.com/libyal/libvhdi/blob/main/COPYING)
# Version: 20210425 (focal) / 20221124 (jammy)
# Notes: This version comes from the GIFT repository

include:
  - mat.repos.gift

mat-apt-packages-libvhdi-dev:
  pkg.installed:
    - name: libvhdi-dev
    - require:
      - sls: mat.repos.gift
