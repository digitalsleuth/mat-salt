include:
  - mat.apt-packages.python3-pip

mat-python3-packages-construct:
  pip.installed:
    - name: construct
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
