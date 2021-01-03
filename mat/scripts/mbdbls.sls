# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3

mat-scripts-mbdbls:
  file.managed:
    - name: /usr/local/bin/mbdbls.py
    - source: https://github.com/digitalsleuth/mbdbls/raw/master/mbdbls.py
    - source_hash: sha256=38ffe16e5994728511c1dc8ba0a0a795a256ca2dc85fe5fc90bbda13714a6f95
    - mode: 755
    - require:
      - sls: mat.apt-packages.python3
