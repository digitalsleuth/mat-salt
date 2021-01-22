# Name: libafflib-dev
# Website: https://github.com/sshock/AFFLIBv3
# Description: Library for utilizing the Advanced Forensic Format
# Category:
# Author: https://github.com/sshock/AFFLIBv3/blob/master/AUTHORS
# License: Multi-License (https://github.com/sshock/AFFLIBv3/blob/master/COPYING)
# Notes: 

include:
  - mat.repos.gift

mat-apt-packages-libafflib-dev:
  pkg.installed:
    - name: libafflib-dev
    - require:
      - sls: mat.repos.gift
