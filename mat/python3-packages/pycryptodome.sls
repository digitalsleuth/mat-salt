# Name: pycryptodome
# Website: https://www.pycryptodome.org/en/latest/
# Description: Python package of low-level cryptographic primitives
# Category: Encryption
# Author: Helder Eijs
# License: Public Domain, BSD, OCB (https://github.com/Legrandin/pycryptodome/blob/master/LICENSE.rst)
# Notes: 

include:
  - mat.apt-packages.python3-pip

mat-python3-packages-pycryptodome:
  pip.installed:
    - name: pycryptodome
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip

