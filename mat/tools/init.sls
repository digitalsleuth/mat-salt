include:
  - mat.tools.eclipse
  - mat.tools.apktool
  - mat.tools.cutter
  - mat.tools.android-studio

mat-tools:
  test.nop:
    - require:
      - sls: mat.tools.eclipse
      - sls: mat.tools.apktool
      - sls: mat.tools.cutter
      - sls: mat.tools.android-studio
