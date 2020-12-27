# Name: yara-python
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip
  - mat.python3-packages.wheel

yara-python:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.wheel
