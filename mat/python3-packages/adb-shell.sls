# Name: adb-shell
# Website: https://github.com/JeffLIrion/adb_shell
# Description: Python implementation of ADB
# Category:
# Author: Jeff L Irion
# License: Apache License v2.0 (https://github.com/JeffLIrion/adb_shell/blob/master/LICENSE)
# Notes: python3 module

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-adb-shell:
  pip.installed:
    - names:
      - adb-shell
      - adb-shell[usb]
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip


