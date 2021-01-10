# Name: Andriller CE (Community Edition)
# Website: https://github.com/den4uk/andriller
# Description: Android acquisition software utility
# Category:
# Author: Denis Sazonov
# License: MIT License (https://github.com/den4uk/andriller/blob/master/LICENSE)
# Notes: andriller-gui.py

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python3-tk
  - mat.apt-packages.android-tools-adb
  - mat.apt-packages.git

mat-python3-packages-andriller:
  pip.installed:
    - name: git+https://github.com/den4uk/andriller
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-tk
      - sls: mat.apt-packages.android-tools-adb
