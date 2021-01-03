# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python2

mat-scripts-sqlparse-source:
  file.managed:
    - name: /usr/local/bin/sqlparse.py
    - source: https://github.com/mdegrazia/SQLite-Deleted-Records-Parser/raw/master/sqlparse_v1.3.py
    - source_hash: e60b02e8a9a258109b06bdd32ce9f4a7ff05d879fdf0c069d2ebcbba638f9f16
    - mode: 755

mat-scripts-sqlparse-shebang:
  file.prepend:
    - name: /usr/local/bin/sqlparse.py
    - text: '#!/usr/bin/env python2'
    - require:
      - file: mat-scripts-sqlparse-source

