# Name: frida-ios-dump
# Website: https://github.com/AloneMonkey/frida-ios-dump
# Description: Pull Decrypted IPA from jailbroken IOS device
# Category: iOS
# Author: AloneMonkey
# License: MIT (https://github.com/AloneMonkey/frida-ios-dump/blob/master/LICENSE)
# Notes: frida-ios-dump

include:
  - mat.apt-packages.python3-pip
  - mat.python3-packages.frida

mat-scripts-frida-ios-dump:
  pip.installed:
    - bin_env: /usr/bin/python3
    - requirements: https://github.com/AloneMonkey/frida-ios-dump/raw/master/requirements.txt
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.frida

mat-scripts-frida-ios-dump-source1:
  file.managed:
    - name: /usr/local/bin/dump.js
    - mode: 755
    - source: https://github.com/AloneMonkey/frida-ios-dump/raw/master/dump.js
    - source_hash: sha256=1dd7e90b82dd723737fe4943ee070d5f815ede628b8c96291ec569f4f1f27d89
    - watch:
      - pip: mat-scripts-frida-ios-dump

mat-scripts-frida-ios-dump-source2:
  file.managed:
    - name: /usr/local/bin/frida-ios-dump.py
    - mode: 755
    - source: https://github.com/AloneMonkey/frida-ios-dump/raw/master/dump.py
    - source_hash: sha256=83e1d3cba473a86ea87c3eaf4af604c5629fe616028de13fb68dd8b46187a3a6
    - watch:
      - pip: mat-scripts-frida-ios-dump

mat-scripts-frida-ios-dump-source3:
  file.managed:
    - name: /usr/local/bin/process.sh
    - mode: 755
    - source: https://github.com/AloneMonkey/frida-ios-dump/raw/master/process.sh
    - source_hash: sha256=bc732ae3541e31095dd256ce70962057d4aece81f780340092f987fc3a2a1afe
    - watch:
      - pip: mat-scripts-frida-ios-dump

mat-scripts-frida-ios-dump-shebang:
  file.replace:
    - name: /usr/local/bin/frida-ios-dump.py
    - pattern: '#!/usr/bin/env python\n'
    - repl: '#!/usr/bin/env python3\n'
    - count: 1
    - prepend_if_not_found: False
    - watch:
      - pip: mat-scripts-frida-ios-dump
