# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

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

mat-tools-ileapp-requirements-mod:
  file.replace:
    - name: /usr/local/src/ileapp/requirements.txt
    - pattern: "pyinstaller\n"
    - repl: "pyinstaller==3.6\n"
    - count: 1
    - prepend_if_not_found: False
    - require:
      - git: mat-tools-ileapp-source

mat-tools-ileapp-remove-enum34:
  pip.removed:
    - name: enum34
    - bin_env: /usr/bin/python3

mat-tools-ileapp-requirements:
  pip.installed:
    - requirements: /usr/local/src/ileapp/requirements.txt
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-tk
      - file: mat-tools-ileapp-requirements-mod

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
