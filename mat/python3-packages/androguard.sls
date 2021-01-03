# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python2-pip
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python3-pyqt5
  - mat.python3-packages.pyperclip

mat-python3-packages-androguard:
  pip.installed:
    - name: androguard
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-pyqt5
      - sls: mat.python3-packages.pyperclip
