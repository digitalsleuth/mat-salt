# Name: objection
# Website: https://github.com/sensepost/objection
# Description: Runtime Mobile Exploration
# Category: Android, iOS
# Author: Leon Jacobs, SensePost
# License: GNU GPL v3 (https://github.com/sensepost/objection/blob/master/LICENSE)
# Notes: 

include:
  - mat.apt-packages.python3-pip
  - mat.python3-packages.frida

mat-python3-packages-objection:
  pip.installed:
    - name: objection
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.frida
