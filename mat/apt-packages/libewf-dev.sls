# Name: libewf-dev
# Website: https://github.com/libyal/libewf-legacy
# Description: EWF Image analysis library
# Category: Image Utilities
# Author: Joachim Metz (https://github.com/libyal/libewf-legacy/blob/main/AUTHORS)
# License: GNU General Public License v3.0 and Lesser (https://github.com/libyal/libewf-legacy/blob/main/COPYING)
# Version: 20140812 (focal) / 20140814 (jammy)
# Notes: This version comes from the GIFT repository, and is based on the Legacy library

include:
  - mat.repos.gift

mat-apt-packages-libewf-dev:
  pkg.installed:
    - name: libewf-dev
    - require:
      - sls: mat.repos.gift
