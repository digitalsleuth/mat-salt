# Name: yara-python
# Website: https://github.com/VirusTotal/yara-python
# Description: Python interface for YARA
# Category: System
# Author: Victor M. Alvarez
# License: Apache License 2.0 (https://github.com/VirusTotal/yara-python/blob/master/LICENSE)
# Notes: 

include:
  - mat.apt-packages.python3-pip
  - mat.python3-packages.wheel

yara-python:
  pip.installed:
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.wheel
