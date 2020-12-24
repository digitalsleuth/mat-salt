# Name: smalisca
# Website: https://github.com/dorneanu/smalisca
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-smalisca-requirements:
  pip.installed:
    - bin_env: /usr/bin/python3
    - requirements: https://github.com/dorneanu/smalisca/raw/master/requirements.txt
    - upgrade: False
    - require:
      - sls: mat.apt-packages.python3-pip

mat-python3-packages-smalisca-install:
  pip.installed:
    - name: smalisca
    - bin_env: /usr/bin/python3
    - upgrade: False
    - require:
      - sls: mat.apt-packages.python3-pip
