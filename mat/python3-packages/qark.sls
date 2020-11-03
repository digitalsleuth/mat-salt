# Name: qark
# Website: https://github.com/linkedin/qark
# Description: Android Vulnerability Assessment Tool
# Category:
# Author: LinkedIn
# License: Apache 2.0 (https://github.com/linkedin/qark/blob/master/LICENSE)
# Notes: Required LANG and LANGUAGE set to C.UTF-8

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-qark-install:
  pip.installed:
    - name: qark
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
