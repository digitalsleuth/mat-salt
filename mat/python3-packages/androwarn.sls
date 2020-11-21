include:
  - mat.apt-packages.python3-pip

mat-python3-packages-androwarn:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/androwarn
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
