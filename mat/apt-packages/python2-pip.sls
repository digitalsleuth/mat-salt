# Name: python2-pip
# Website: https://python.org
# Description: Package installer for Python 2 programming language
# Category: Programming
# Author: Python Software Foundation
# License: Python Software Foundation (https://docs.python.org/2.7/license.html)
# Version: 20.3.4
# Notes: Python 2 is deprecated as of Jan 2020

include:
  - mat.apt-packages.python2
  - mat.apt-packages.curl

mat-apt-packages-python2-pip-install-script:
  cmd.run:
    - name: curl -o /tmp/get-pip.py https://bootstrap.pypa.io/pip/2.7/get-pip.py
    - unless: which pip2
    - require:
      - sls: mat.apt-packages.python2
      - sls: mat.apt-packages.curl

mat-apt-packages-python2-pip-install:
  cmd.run:
    - name: python2 /tmp/get-pip.py
    - unless: which pip2
    - require:
      - cmd: mat-apt-packages-python2-pip-install-script
