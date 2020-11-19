include:
  - mat.config.salt-minion
  - mat.config.user
  
mat-config:
  test.nop:
    - require:
      - sls: mat.config.salt-minion
      - sls: mat.config.user
