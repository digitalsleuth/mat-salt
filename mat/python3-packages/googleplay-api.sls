include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.protobuf-compiler
  - mat.apt-packages.git

mat-python3-packages-googleplay-api:
  pip.installed
    - name: git+https://github.com/NoMore201/googleplay-api
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.protobuf-compiler
      - sls: mat.apt-packages.git
