# Install has to come from the forked repo, as there's a UTF-8 error with the README.md

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.git

mat-python3-packages-androwarn:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/androwarn
#   - name: androwarn
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.git
