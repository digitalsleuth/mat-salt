# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python3-tk
  - mat.apt-packages.android-tools-adb

mat-python3-packages-andriller:
  pip.installed:
    - name: git+https://github.com/den4uk/andriller
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-tk
      - sls: mat.apt-packages.android-tools-adb
