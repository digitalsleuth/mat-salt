include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.git
  - mat.apt-packages.python3-tk

mat-tools-ileapp-source:
  git.cloned:
    - name: https://github.com/abrignoni/ileapp
    - target: /usr/local/src/ileapp
    - require:
      - sls: mat.apt-packages.git

mat-tools-ileapp-requirements:
  pip.installed:
    - requirements: /usr/local/src/ileapp/requirements.txt
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-tk

mat-tools-ileapp-py-shebang:
  file.prepend:
    - name: /usr/local/src/ileapp/ileapp.py
    - text: '#!/usr/bin/env python3'
    - watch:
      - pip: mat-tools-ileapp-requirements
    - require:
      - git: mat-tools-ileapp-source

mat-tools-ileapp-gui-shebang:
  file.prepend:
    - name: /usr/local/src/ileapp/ileappGUI.py
    - text: '#!/usr/bin/env python3'
    - watch:
      - pip: mat-tools-ileapp-requirements
    - require:
      - git: mat-tools-ileapp-source

mat-tools-ileapp-py-wrapper:
  file.managed:
    - name: /usr/local/bin/ileapp
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/ileapp/ileapp.py ${*}

mat-tools-ileapp-gui-wrapper:
  file.managed:
    - name: /usr/local/bin/ileappGUI
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/ileapp/ileappGUI.py ${*}
