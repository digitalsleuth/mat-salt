include:
  - mat.tools.eclipse
  - mat.tools.apktool

mat-tools:
  test.nop:
    - require:
      - sls: mat.tools.eclipse
      - sls: mat.tools.apktool
