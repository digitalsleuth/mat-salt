include:
  - mat.apt-packages.python3-pip

mat-python3-packages-wheel:
  pip.installed:
    - name: wheel>=0.36
    - upgrade: True
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
