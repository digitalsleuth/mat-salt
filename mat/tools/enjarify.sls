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

mat-tools-enjarify-wrapper:
  file.managed:
    - name: /usr/local/bin/enjarify
    - mode: 755
    - contents:
      - '/usr/bin/python3 -O -m usr.local.src.enjarify.enjarify.main ${*}'
    - watch:
      - git: mat-tools-enjarify-clone
