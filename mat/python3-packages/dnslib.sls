# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip

dnslib:
  pip.installed:
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
