# Name: Androwarn
# Website: https://github.com/digitalsleuth/androwarn
# Description: Static code analyzer for Android applications
# Category: Android
# Author: digitalsleuth (original author maaaaz)
# License: GNU GPL v3 (https://github.com/digitalsleuth/androwarn/blob/master/androwarn/COPYING)
# Notes: 

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.git

mat-python3-packages-androwarn:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/androwarn
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.git
