# Name: smalisca
# Website: https://github.com/dorneanu/smalisca
# Description: Static Code Analysis for Smali files
# Category: Android
# Author: Victor Dorneanu
# License: MIT (https://github.com/dorneanu/smalisca/blob/master/LICENSE.rst)
# Notes: smalisca

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.git
  - mat.python3-packages.wheel

mat-python3-packages-smalisca-requirements:
  pip.installed:
    - bin_env: /usr/bin/python3
    - names:
      - cement==2.6.0
      - Flask==0.10.1
      - Flask-Restless==0.17.0
      - Flask-SQLAlchemy==2.0
      - graphviz==0.4.4
      - itsdangerous==0.24
      - Jinja2==2.7.3
      - MarkupSafe==0.23
      - mimerender==0.5.5
      - prettytable==0.7.2
      - pyfiglet==0.7.4
      - python-mimeparse==0.1.4
      - six==1.9.0
      - SQLAlchemy==1.0.5
      - Werkzeug==0.10.4
      - configparser==3.5.0
    - upgrade: False
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.python3-packages.wheel

mat-python3-packages-smalisca-install:
  pip.installed:
    - name: git+https://github.com/dorneanu/smalisca.git
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.git
      - sls: mat.python3-packages.wheel
