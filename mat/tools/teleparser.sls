include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.git
  - mat.python3-packages.construct

mat-tools-teleparser-source:
  git.cloned:
    - name: https://github.com/realitynet/teleparser
    - target: /usr/local/src/teleparser
    - require:
      - sls: mat.apt-packages.git
      - sls: mat.python3-packages.construct

mat-tools-teleparser-wrapper:
  file.managed:
    - name: /usr/local/bin/teleparser
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/teleparser/teleparser.py ${*}
    - require:
      - git: mat-tools-teleparser-source
