# Name: androguard
# Website: https://androguard.readthedocs.io/en/latest/
# Description: Python3-based Android Analysis Toolset
# Category: Android
# Author: https://github.com/androguard/androguard#authors-androguard-team
# License: Apache License 2.0 (https://github.com/androguard/androguard/blob/master/LICENCE-2.0)
# Notes: 

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python3-pyqt5
  - mat.python3-packages.pyperclip

mat-python3-packages-androguard:
  pip.installed:
    - name: androguard
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-pyqt5
      - sls: mat.python3-packages.pyperclip
