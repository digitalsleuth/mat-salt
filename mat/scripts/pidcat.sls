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
    - source_hash: sha256=410fdd02b879db1cf3def292ab4981d159e95ff5c30ab2d7e937fa3367596f79
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
