# Name: passionfruit
# Website: https://github.com/chaitin/passionfruit
# Description: 
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.nodejs
  - mat.python3-packages.frida

mat-node-packages-passionfruit:
  cmd.run:
    - name: npm install -g passionfruit --user root
    - require:
      - sls: mat.apt-packages.nodejs
      - sls: mat.python3-packages.frida
