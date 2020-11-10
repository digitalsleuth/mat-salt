include:
  - mat.apt-packages.git
  - mat.apt-packages.python3-pip

mat-tools-runtime-source:
  git.cloned:
    - name: https://github.com/m0bilesecurity/RMS-Runtime-Mobile-Security.git
    - target: /usr/local/src/rms/
    - require:
      - sls: mat.apt-packages.git

mat-tools-runtime-requirements:
  pip.installed:
    - requirements: /usr/local/src/rms/requirements.txt
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip

mat-tools-runtime-wrapper:
  file.managed:
    - name: /usr/local/bin/runtime-mobile-security
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - /usr/bin/python3 /usr/local/src/rms/mobilesecurity.py ${*}
    - watch:
      - pip: mat-tools-runtime-requirements
