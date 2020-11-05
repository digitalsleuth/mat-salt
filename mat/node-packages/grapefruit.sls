{%- set user = salt['pillar.get']('mat_user', 'mat') -%} 

include:
  - mat.apt-packages.nodejs
  - mat.apt-packages.git
  - mat.apt-packages.tmux
  - mat.config.user

mat-node-packages-grapefruit-git:
  git.latest:
    - name: https://github.com/ChiChou/grapefruit.git
    - submodules: True
    - target: /usr/local/grapefruit
    - user: root
    - branch: master
    - force_fetch: True
    - force_checkout: True
    - force_clone: True
    - force_reset: True
    - require:
      - sls: mat.apt-packages.git

mat-node-packages-grapefruit-install:
  cmd.run:
#    - name: npm install --user {{ user }} --unsafe-perm
    - name: npm install
    - cwd: /usr/local/grapefruit
    - require:
      - sls: mat.apt-packages.nodejs
      - sls: mat.apt-packages.tmux
      - sls: mat.config.user

mat-node-packages-grapefruit-wrapper:
  file.managed:
    - name: /usr/local/bin/grapefruit
    - contents:
      - '#!/bin/bash'
      - cd /usr/local/grapefruit && npm start
    - mode: 755
    - watch:
      - cmd: mat-node-packages-grapefruit-install
