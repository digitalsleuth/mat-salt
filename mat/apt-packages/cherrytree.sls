# Name: cherrytree
# Website: https://www.giuspen.com
# Description: Note taking application
# Category: Documentation
# Author: Giuseppe Penone
# License: GNU General Public License v3.0+ (https://github.com/giuspen/cherrytree/blob/master/license.txt)
# Version: 0.99.53
# Notes: cherrytree

include:
  - mat.repos.giuspen
  - mat.apt-packages.libcanberra-gtk-module

cherrytree:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.libcanberra-gtk-module
      - sls: mat.repos.giuspen
