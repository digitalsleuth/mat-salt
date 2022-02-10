# Name: drozer
# Website: https://mwr.to/drozer
# Description: 
# Category: Android
# Author: MWI InfoSecurity
# License: Copyright MWR InfoSecurity, Apache 2.0 (https://github.com/FSecureLABS/drozer/blob/develop/LICENSE)
# Notes: drozer, requires drozer agent (https://github.com/FSecureLABS/drozer/releases/download/2.3.4/drozer-agent-2.3.4.apk)

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python2-pip
  - mat.python2-packages.twisted
  - mat.python2-packages.service-identity

mat-python2-packages-drozer:
  pip.installed:
    - name: https://github.com/mwrlabs/drozer/releases/download/2.4.4/drozer-2.4.4-py2-none-any.whl
    - bin_env: /usr/bin/python2
    - require:
      - sls: mat.apt-packages.python2-pip
      - sls: mat.python2-packages.twisted
      - sls: mat.python2-packages.service-identity
