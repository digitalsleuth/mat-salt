include:
  - mat.apt-packages.python3-pip

mat-python3-packages-configparser:
  pip.installed:
    - name: configparser
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
