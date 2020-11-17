# Name: axmlparserpy
# Website: https://github.com/kzjeef/axmlparserpy
# Description: Python3 library for parsing Android XML
# Category:
# Author: https://github.com/antitree/AxmlParserPY#contributors
# License: GNU Gneral Public License v3 (https://github.com/kzjeef/AxmlParserPY/blob/master/README)
# Notes: import axmlparserpy

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.git

mat-python3-packages-axmlparserpy-install:
  pip.installed:
    - bin_env: /usr/bin/python3
    - name: git+https://github.com/kzjeef/axmlparserpy
    - require:
      - sls: mat.apt-packages.git
      - sls: mat.apt-packages.python3-pip
