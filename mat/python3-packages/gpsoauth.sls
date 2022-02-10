# Name: gpsoauth
# Website: https://github.com/simon-weber/gpsoauth
# Description: Python Library for Google Play Services OAuth
# Category: Android
# Author: Simon Weber
# License: MIT (https://github.com/simon-weber/gpsoauth/blob/master/LICENSE)
# Notes: 

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-gpsoauth:
  pip.installed:
    - name: gpsoauth
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
