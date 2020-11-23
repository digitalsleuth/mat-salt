include:
  - mat.tools.aleapp
  - mat.tools.androbugs
  - mat.tools.android-studio
  - mat.tools.apktool
  - mat.tools.apollo
  - mat.tools.axmlprinter
  - mat.tools.axmlprinter2
  - mat.tools.burpsuite-community
  - mat.tools.bytecode-viewer
  - mat.tools.classyshark
  - mat.tools.cutter
  - mat.tools.eclipse
  - mat.tools.enjarify
  - mat.tools.flexdecrypt
  - mat.tools.ghidra
  - mat.tools.ileapp
  - mat.tools.impactor
  - mat.tools.jadx
  - mat.tools.jd-gui
  - mat.tools.openmf
  - mat.tools.pvrtextools
  - mat.tools.runtime-mobile-security
  - mat.tools.yara

mat-tools:
  test.nop:
    - require:
      - sls: mat.tools.aleapp
      - sls: mat.tools.androbugs
      - sls: mat.tools.android-studio
      - sls: mat.tools.apktool
      - sls: mat.tools.apollo
      - sls: mat.tools.axmlprinter
      - sls: mat.tools.axmlprinter2
      - sls: mat.tools.burpsuite-community
      - sls: mat.tools.bytecode-viewer
      - sls: mat.tools.classyshark
      - sls: mat.tools.cutter
      - sls: mat.tools.eclipse
      - sls: mat.tools.enjarify
      - sls: mat.tools.flexdecrypt
      - sls: mat.tools.ghidra
      - sls: mat.tools.ileapp
      - sls: mat.tools.impactor
      - sls: mat.tools.jadx
      - sls: mat.tools.jd-gui
      - sls: mat.tools.openmf
      - sls: mat.tools.pvrtextools
      - sls: mat.tools.runtime-mobile-security
      - sls: mat.tools.yara
