# Name: whapa
# Website: https://github.com/B16f00t/whapa
# Description: WhatsApp Parser Toolset
# Category:
# Author: Ivan Moreno
# License: GNU General Public License v3.0 (https://github.com/B16f00t/whapa/blob/master/doc/LICENSE)
# Notes: whapa
# Tool currently is statically bound to the directory - will require modifications - not included at this time.

include:
  - mat.apt-packages.python3
  - mat.python3-packages.gpsoauth
  - mat.python3-packages.pycryptodome
  - mat.python3-packages.configparser
  - mat.apt-packages.git

mat-python3-packages-whapa-source:
  git.cloned:
    - name: https://github.com/b16f00t/whapa.git
    - target: /usr/local/src/whapa
    - require:
      - sls: mat.apt-packages.git

mat-python3-packages-whapa-wrapper:
  file.managed:
    - name: /usr/local/bin/whapa
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/whapa/whapa-gui.py ${*}
    - mode: 755
    - watch:
      - git: mat-python3-packages-whapa-source
