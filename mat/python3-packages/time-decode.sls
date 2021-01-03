# Name: time-decode
# Website: https://github.com/digitalsleuth/time_decode
# Description: Timestamp encode/decode tool
# Category:
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Notes: time_decode.py

include:
  - mat.apt-packages.python3-pip

time-decode:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
