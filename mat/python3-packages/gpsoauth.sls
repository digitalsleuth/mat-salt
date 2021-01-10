include:
  - mat.apt-packages.python3-pip

mat-python3-packages-gpsoauth:
  pip.installed:
    - name: gpsoauth
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
