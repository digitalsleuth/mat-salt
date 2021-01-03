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

mat-tools-aleapp-source:
  git.cloned:
    - name: https://github.com/abrignoni/aleapp
    - target: /usr/local/src/aleapp
    - require:
      - sls: mat.apt-packages.git

mat-tools-aleapp-requirements:
  pip.installed:
    - requirements: /usr/local/src/aleapp/requirements.txt
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-tk

mat-tools-aleapp-py-shebang:
  file.prepend:
    - name: /usr/local/src/aleapp/aleapp.py
    - text: '#!/usr/bin/env python3'
    - watch:
      - pip: mat-tools-aleapp-requirements
    - require:
      - git: mat-tools-aleapp-source

mat-tools-aleapp-gui-shebang:
  file.prepend:
    - name: /usr/local/src/aleapp/aleappGUI.py
    - text: '#!/usr/bin/env python3'
    - watch:
      - pip: mat-tools-aleapp-requirements
    - require:
      - git: mat-tools-aleapp-source

mat-tools-aleapp-py-wrapper:
  file.managed:
    - name: /usr/local/bin/aleapp
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/aleapp/aleapp.py ${*}

mat-tools-aleapp-gui-wrapper:
  file.managed:
    - name: /usr/local/bin/aleappGUI
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/aleapp/aleappGUI.py ${*}

