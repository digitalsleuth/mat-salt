# Name: pyperclip
# Website: https://github.com/asweigart/pyperclip
# Description: Cross-platform Python module for copy and paste clipboard functions
# Category: System
# Author: Al Sweigart
# License: BSD 3-Clause (https://github.com/asweigart/pyperclip/blob/master/LICENSE.txt)
# Notes: 

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-pyperclip:
  pip.installed:
    - name: pyperclip
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
