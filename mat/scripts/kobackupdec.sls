# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.python3-packages.pycryptodome

mat-scripts-kobackupdec:
  file.managed:
    - name: /usr/local/bin/kobackupdec.py
    - source: https://github.com/RealityNet/kobackupdec/raw/master/kobackupdec.py
    - source_hash: sha256=fb472fb15ef201b57d0b423026ca192f46c7bc31c7c8ed037d02d0be2ddff7ea
    - mode: 755
    - require:
      - sls: mat.python3-packages.pycryptodome
