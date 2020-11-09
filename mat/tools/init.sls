include:
  - mat.tools.androbugs
  - mat.tools.android-studio
  - mat.tools.apktool
  - mat.tools.axmlprinter2
  - mat.tools.bytecode-viewer
  - mat.tools.classyshark
  - mat.tools.cutter
  - mat.tools.eclipse
  - mat.tools.enjarify
  - mat.tools.flexdecrypt
  - mat.tools.ghidra
  - mat.tools.impactor
  - mat.tools.jadx
  - mat.tools.pvrtextools
  - mat.tools.yara

mat-tools:
  test.nop:
    - require:
      - sls: mat.tools.androbugs
      - sls: mat.tools.android-studio
      - sls: mat.tools.apktool
      - sls: mat.tools.axmlprinter2
      - sls: mat.tools.bytecode-viewer
      - sls: mat.tools.classyshark
      - sls: mat.tools.cutter
      - sls: mat.tools.eclipse
      - sls: mat.tools.enjarify
      - sls: mat.tools.flexdecrypt
      - sls: mat.tools.ghidra
      - sls: mat.tools.impactor
      - sls: mat.tools.jadx
      - sls: mat.tools.pvrtextools
      - sls: mat.tools.yara
