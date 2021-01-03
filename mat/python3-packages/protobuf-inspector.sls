# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-protobuf-inspector:
  pip.installed:
    - name: protobuf-inspector
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
