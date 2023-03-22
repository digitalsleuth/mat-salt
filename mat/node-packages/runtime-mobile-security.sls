# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Version: 
# Notes: 

include:
  - mat.apt-packages.nodejs
  - mat.python3-packages.frida

mat-node-packages-runtime-mobile-security:
  cmd.run:
    - name: npm install -g rms-runtime-mobile-security --user root
    - require:
      - sls: mat.apt-packages.nodejs
      - sls: mat.python3-packages.frida
