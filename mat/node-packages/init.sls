include:
  - mat.node-packages.bagbak
  - mat.node-packages.passionfruit

mat-node-packages:
  test.nop:
    - require:
      - sls: mat.node-packages.bagbak
      - sls: mat.node-packages.passionfruit
