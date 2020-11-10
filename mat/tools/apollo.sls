include:
  - mat.apt-packages.python3
  - mat.apt-packages.git
  - mat.python3-packages.simplekml

mat-scripts-apollo-source:
  git.cloned:
    - name: https://github.com/mac4n6/APOLLO.git
    - target: /usr/local/src/apollo
    - require:
      - sls: mat.apt-packages.git

mat-scripts-apollo-wrapper:
  file.managed:
    - name: /usr/local/bin/apollo
    - contents:
      - '#!/bin/bash'
      - python3 /usr/local/src/apollo/apollo.py ${*}
    - mode: 755
    - require:
      - sls: mat.apt-packages.python3
      - sls: mat.python3-packages.simplekml
