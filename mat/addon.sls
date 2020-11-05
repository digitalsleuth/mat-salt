include:
  - mat.repos
  - mat.config
  - mat.apt-packages
  - mat.node-packages
  - mat.python2-packages
  - mat.python3-packages
  - mat.scripts
  - mat.tools

mat-addon-version-file:
  file.managed:
    - name: /etc/mat-version
    - source: salt://VERSION
    - user: root
    - group: root
    - require:
      - sls: mat.repos
      - sls: mat.config
      - sls: mat.apt-packages
      - sls: mat.node-packages
      - sls: mat.python2-packages
      - sls: mat.python3-packages
      - sls: mat.scripts
      - sls: mat.tools
