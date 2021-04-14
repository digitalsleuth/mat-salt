# Name: pidcat
# Website: https://github.com/JakeWharton/pidcat
# Description: Android colored-output script
# Category: 
# Author: Jake Wharton
# License: Apache 2.0 (https://github.com/JakeWharton/pidcat/blob/master/LICENSE.txt)
# Notes: Required ADB installed

include:
  - mat.apt-packages.python3
  - mat.apt-packages.android-tools-adb

mat-scripts-pidcat-source:
  file.managed:
    - name: /usr/local/bin/pidcat.py
    - source: https://github.com/JakeWharton/pidcat/raw/master/pidcat.py
    - source_hash: sha256=cb6f4f027074920c412be1cc54781c2d8f24e45f719e6c3d6e5e6c15f078b261
    - mode: 755
    - require:
      - sls: mat.apt-packages.python3
      - sls: mat.apt-packages.android-tools-adb

mat-scripts-pidcat-shebang:
  file.replace:
    - name: /usr/local/bin/pidcat.py
    - pattern: '#!/usr/bin/env -S python -u'
    - repl: '#!/usr/bin/env python3'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - file: mat-scripts-pidcat-source
