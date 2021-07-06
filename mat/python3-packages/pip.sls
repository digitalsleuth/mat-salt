
include:
  - mat.apt-packages.python3-pip

mat-python3-packages-pip:
  pip.installed:
    - name: pip==21.0.1
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
