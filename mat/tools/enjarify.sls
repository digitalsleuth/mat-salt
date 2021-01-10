# Name: enjarify
# Website: https://github.com/Storyyeller/enjarify.git
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.python3
  - mat.apt-packages.git

mat-tools-enjarify-clone:
  git.latest:
    - name: https://github.com/Storyyeller/enjarify.git
    - target: /usr/local/src/enjarify
    - user: root
    - branch: master
    - force_fetch: True
    - force_checkout: True
    - force_clone: True
    - force_reset: True
    - require:
      - sls: mat.apt-packages.git
      - sls: mat.apt-packages.python3

mat-tools-enjarify-link:
  file.symlink:
    - target: /usr/local/src/enjarify/enjarify.sh
    - name: /usr/local/bin/enjarify
    - mode: 755
    - force: True
    - watch:
      - git: mat-tools-enjarify-clone
