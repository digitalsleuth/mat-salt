include:
  - mat.apt-packages.python2-pip
  - mat.apt-packages.python3-pip

mat-python2-packages-pymongo:
  pip.installed:
    - name: pymongo
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python2-pip
