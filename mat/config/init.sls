include:
  - mat.config.salt-minion
  - mat.config.user
  - mat.config.ssh
  
mat-config:
  test.nop:
    - require:
      - sls: mat.config.salt-minion
      - sls: mat.config.user
      - sls: mat.config.ssh
