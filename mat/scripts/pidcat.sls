# Name: pidcat
# Website: https://github.com/JakeWharton/pidcat
# Description: Android colored-output script
# Category: 
# Author: Jake Wharton
# License: Apache 2.0 (https://github.com/JakeWharton/pidcat/blob/master/LICENSE.txt)
# Notes: Required ADB installed

include:
  - mat.apt-packages.python3
  - mat.apt-packages.adb

mat-scripts-pidcat-source:
  file.managed:
    - name: /usr/local/bin/pidcat.py
    - source: https://github.com/JakeWharton/pidcat/raw/master/pidcat.py
    - source_hash: sha256=6a7d873e6a05de0324e2b03a191ef7eb0a7cca6e32aabb16a15af5c74b857587
    - mode: 755
    - require:
      - sls: mat.apt-packages.python3
      - sls: mat.apt-packages.adb

mat-scripts-pidcat-shebang:
  file.replace:
    - name: /usr/local/bin/pidcat.py
    - pattern: '#!/usr/bin/env -S python -u'
    - repl: '#!/usr/bin/env python3'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - file: mat-scripts-pidcat-source
