include:
  - mat.tools.eclipse
  - mat.tools.apktool
#  - mat.tools.procyon-decompiler

mat-tools:
  test.nop:
    - require:
      - sls: mat.tools.eclipse
      - sls: mat.tools.apktool
#      - sls: mat.tools.procyon-decompiler
