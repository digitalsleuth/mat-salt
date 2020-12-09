include:
    - mat.addon
    - mat.theme

mat-dedicated:
  test.nop:
    - require:
      - sls: mat.addon
      - sls: mat.theme
