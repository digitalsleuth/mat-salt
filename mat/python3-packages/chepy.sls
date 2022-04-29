# Name: Chepy
# Website: https://github.com/securisec/chepy
# Description: Decode and analyze data using command-line and python library
# Category: Encoding
# Author: Hapsida Securisec (https://twitter.com/securisec)
# License: GNU General Public License (GPL) v3 (https://github.com/securisec/chepy/blob/master/LICENSE)
# Notes: chepy

include:
  - mat.apt-packages.python3-pip
  - mat.python3-packages.setuptools-rust

mat-python3-packages-chepy:
  pip.installed:
    - names:
      - chepy
      - chepy[extras]
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.setuptools-rust
