include:
  - mat.python3-packages.pip

setuptools-rust:
  pip.installed:
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.python3-packages.pip
