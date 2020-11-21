# Name: drozer
# Website: https://mwr.to/drozer
# Description:
# Category:
# Author: MWI InfoSecurity
# License: https://github.com/FSecureLABS/drozer/blob/develop/LICENSE
# Notes: 

include:
  - mat.apt-packages.python2-pip

mat-python2-packages-drozer:
  pip.installed:
    - name: https://github.com/mwrlabs/drozer/releases/download/2.4.4/drozer-2.4.4-py2-none-any.whl
    - bin_env: /usr/bin/python2
    - require:
      - sls: mat.apt-packages.python2-pip
