
include:
  - mat.apt-packages.python3-pip

mat-python3-packages-pip:
  pip.installed:
    - name: pip>=21.4.2
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
