# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.repos.gift

mat-apt-packages-libvmdk-dev:
  pkg.installed:
    - name: libvmdk-dev
    - require:
      - sls: mat.repos.gift
