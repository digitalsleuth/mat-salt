#This will require a virtualenv, as it requires a dex-built version of 3.11.0 yara-python
include:
  - mat.apt-packages.python3-pip
  - mat.python3-packages.yara-python

mat-python3-packages-apkid:
  pip.installed:
    - name: apkid
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.yara-python
