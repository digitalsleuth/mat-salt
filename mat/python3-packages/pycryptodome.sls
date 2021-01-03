# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-pycryptodome:
  pip.installed:
    - name: pycryptodome
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip

