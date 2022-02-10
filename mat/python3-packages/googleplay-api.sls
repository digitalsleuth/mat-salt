# Name: googleplay-api
# Website: https://github.com/NoMore201/googleplay-api
# Description: Google Play Unofficial API
# Category: Android
# Author: Domenico Iezzi
# License: GNU GPL v3 (https://github.com/NoMore201/googleplay-api/blob/master/LICENSE.md)
# Notes: 

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.protobuf-compiler
  - mat.apt-packages.git

mat-python3-packages-googleplay-api:
  pip.installed:
    - name: git+https://github.com/NoMore201/googleplay-api
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.protobuf-compiler
      - sls: mat.apt-packages.git
