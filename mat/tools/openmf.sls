# Name: OpenMF
# Website: https://github.com/scorelab/openmf
# Description: Open Source Mobile Forensics Investigtion Tool for Android
# Category:
# Author: SCoRe Lab
# License: Apache License 2.0 (https://github.com/scorelab/OpenMF/blob/master/LICENSE)
# Notes: collector, converter

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.default-jre
  - mat.apt-packages.git
  - mat.python3-packages.wheel
  - mat.apt-packages.libffi-dev

mat-tools-openmf-source:
  git.cloned:
    - name: https://github.com/scorelab/openmf.git
    - target: /usr/local/src/openmf
    - require:
      - sls: mat.apt-packages.git

mat-tools-openmf-requirements:
  pip.installed:
    - requirements: /usr/local/src/openmf/requirements.txt
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.wheel
      - sls: mat.apt-packages.libffi-dev
    - watch:
      - git: mat-tools-openmf-source

mat-tools-openmf-collector-wrapper:
  file.managed:
    - name: /usr/local/bin/collector
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/openmf/collector.py ${*}
    - mode: 755
    - require:
      - sls: mat.apt-packages.default-jre
    - watch:
      - pip: mat-tools-openmf-requirements
      - git: mat-tools-openmf-source

mat-tools-openmf-converter-wrapper:
  file.managed:
    - name: /usr/local/bin/converter
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/openmf/converter.py ${*}
    - mode: 755
    - require:
      - sls: mat.apt-packages.default-jre
    - watch:
      - pip: mat-tools-openmf-requirements
      - git: mat-tools-openmf-source
