# Name: dnslib
# Website: https://github.com/paulc/dnslib
# Description: Python DNS Library
# Category: Network
# Author: Paul Chakravarti
# License: BSD 2-Clause Simplified (https://github.com/paulc/dnslib/blob/master/LICENSE)
# Notes: 

include:
  - mat.apt-packages.python3-pip

dnslib:
  pip.installed:
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
