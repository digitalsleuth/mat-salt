# Name: libvmdk-dev
# Website: https://github.com/libyal/libvmdk
# Description: Library and tools to access the VMware Virtual Disk format
# Category: Image Utilities
# Author: Joachim Metz et al (https://github.com/libyal/libvmdk/blob/main/AUTHORS)
# License: GNU General Public License v3.0 and Lesser (https://github.com/libyal/libvmdk/blob/main/COPYING)
# Version: 20210807 (focal) / 20221124 (jammy)
# Notes: 

include:
  - mat.repos.gift

mat-apt-packages-libvmdk-dev:
  pkg.installed:
    - name: libvmdk-dev
    - require:
      - sls: mat.repos.gift
