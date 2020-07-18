include:
  - mat.repos
  - mat.apt-packages
  - mat.python-packages
  - mat.python3-packages
  - mat.scripts
  - mat.config
  - mat.tools

mat-addon-version-file:
  file.managed:
    - name: /etc/mat-version
    - source: salt://VERSION
    - user: root
    - group: root
    - require:
      - sls: mat.repos
      - sls: mat.apt-packages
      - sls: mat.python-packages
      - sls: mat.python3-packages
      - sls: mat.scripts
      - sls: mat.config
      - sls: mat.tools
