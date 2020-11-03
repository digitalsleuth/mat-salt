# Name: yara-python
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip

yara-python:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
