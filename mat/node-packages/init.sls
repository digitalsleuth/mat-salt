include:
  - mat.node-packages.bagbak
#  - mat.node-packages.grapefruit
#  - mat.node-packages.passionfruit
  - mat.node-packages.runtime-mobile-security

mat-node-packages:
  test.nop:
    - require:
      - sls: mat.node-packages.bagbak
#      - sls: mat.node-packages.grapefruit
#      - sls: mat.node-packages.passionfruit
      - sls: mat.node-packages.runtime-mobile-security
