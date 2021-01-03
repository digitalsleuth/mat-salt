# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip

simplekml:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: False
    - require:
      - sls: mat.apt-packages.python3-pip
