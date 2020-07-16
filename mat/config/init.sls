include:
  - mat.config.user
  - mat.config.salt-minion
  
mat-config:
  test.nop:
    - require:
      - sls: mat.config.user
      - sls: mat.config.salt-minion
