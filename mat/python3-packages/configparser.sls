# Name: configparser
# Website: https://github.com/jaraco/configparser/
# Description: Backport of Python 3 Configparser
# Category: Scripting
# Author: Jason R. Coombs
# License: MIT (https://github.com/jaraco/configparser/blob/main/LICENSE)

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-configparser:
  pip.installed:
    - name: configparser
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
