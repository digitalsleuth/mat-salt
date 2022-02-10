# Name: protobuf-inspector
# Website: https://github.com/mildsunrise/protobuf-inspector
# Description: Tool to reverse engineer Protocol Buffers
# Category: Android
# Author: Alba Mendez
# License: ISC (https://github.com/mildsunrise/protobuf-inspector/blob/master/LICENSE)
# Notes: 

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-protobuf-inspector:
  pip.installed:
    - name: protobuf-inspector
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
